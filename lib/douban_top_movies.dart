import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dou_ban_movie/model/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toast/flutter_toast.dart';

class TopMoviesPage extends StatefulWidget {
  @override
  TopMoviesState createState() => new TopMoviesState();
}

class TopMoviesState extends State<TopMoviesPage> {
  int start = 0;
  List<Subjects> mMovies = new List();
  bool canLoad = true;

  @override
  void initState() {
    super.initState();
    _getHotMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: mMovies.length,
        itemBuilder: buildItem);
  }

  _getHotMovies() async {
    if (canLoad) {
      FlutterToast.showToast("$start");
      var dio = new Dio();
      Response response = await dio.get(
          "https://api.douban.com/v2/movie/top250?apikey=0b2bdeda43b5688921839c8ecb20399b&start=$start");
      try {
        Movies movies = Movies.fromJson(response.data);
        if (response.statusCode == HttpStatus.OK) {
          setState(() {
            this.mMovies.addAll(movies.subjects);
            this.start = this.mMovies.length;
            this.canLoad = (start < movies.total);
          });
        } else {
          FlutterToast.showToast("网络错误");
        }
      } catch (e) {
        FlutterToast.showToast(e);
      }
    }
  }

  Widget buildItem(BuildContext context, int index) {
    if (index == mMovies.length - 1) {
      //已经加载了最后一个元素了，现在加载更多
      _getHotMovies();
    }
    Subjects subjects = mMovies[index];
    return new Card(
        elevation: 0.5,
        margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: new Padding(
            padding: new EdgeInsets.only(left: 16.0, right: 16.0),
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new CachedNetworkImage(
                    imageUrl: subjects.images.large,
                    width: 90.0,
                    height: 160.0,
                  ),
                  new Container(
                    width: 200.0,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Padding(
                          padding: new EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: new Text(
                            subjects.title + "$index",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: new Text(
                            "导演: " + subjects.directors[0].name,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        new Row(
                          children: buildActors(mMovies[index].casts),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  List<Widget> buildActors(List<Casts> casts) {
    List<Widget> list = new List();
    for (var cast in casts) {
      list.add(new Column(
        children: <Widget>[
          new Container(
            width: 45.0,
            height: 45.0,
            margin: new EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
            child: new CircleAvatar(
              backgroundImage: new CachedNetworkImageProvider(
                  cast.avatars != null ? cast.avatars.medium : ""),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 5.0, left: 8.0),
            child: new Text(
              cast.name,
              style: new TextStyle(fontSize: 8.0, color: Colors.black87),
            ),
          )
        ],
      ));
    }
    return list;
  }

/* void showNetWorkErr(e) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Container(
              width: 100.0,
              height: 100.0,
              padding: const EdgeInsets.all(16.0),
              child: new Center(
                child: AlertDialog(
                  content: Text(e.toString()),
                ),
              ),
            ));
  }*/
}
