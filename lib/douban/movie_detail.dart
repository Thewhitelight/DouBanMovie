import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dou_ban_movie/douban/avatars.dart';
import 'package:dou_ban_movie/douban/image_detail.dart';
import 'package:dou_ban_movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toast/flutter_toast.dart';

class MovieDetail extends StatefulWidget {
  final String id;

  const MovieDetail(this.id);

  @override
  MovieDetailState createState() => new MovieDetailState();
}

class MovieDetailState extends State<MovieDetail> {
  Detail detail;

  @override
  Widget build(BuildContext context) {
    if (detail == null) {
      return new Scaffold(
        body: new Center(
          child: new Text("loading"),
        ),
      );
    }
    return new Scaffold(
      body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: new FlexibleSpaceBar(
                    title: new Text(detail.title,
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                new ImageDetail(
                                    imageUrl: detail.images.large)));
                      },
                      child: new CachedNetworkImage(
                        imageUrl: detail.images.medium,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ];
          },
          body: new SingleChildScrollView(
            child: new Padding(
              padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "导演:",
                  ),
                  new Avatars(detail.directors),
                  new Text(
                    "主要演员:",
                  ),
                  new Avatars(detail.casts),
                  new Padding(
                    padding: new EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      "故事概括:",
                    ),
                  ),
                  new Text(detail.summary),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _getMovieDetail();
  }

  _getMovieDetail() async {
    var dio = new Dio();
    Response response =
    await dio.get("https://api.douban.com/v2/movie/subject/${widget.id}");
    try {
      Detail detail = Detail.fromJson(response.data);
      if (response.statusCode == HttpStatus.OK) {
        setState(() {
          this.detail = detail;
        });
      } else {
        FlutterToast.showToast("网络错误");
      }
    } catch (e) {
      FlutterToast.showToast(e.toString());
    }
  }
}
