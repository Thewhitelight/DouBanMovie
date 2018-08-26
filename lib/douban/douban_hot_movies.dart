import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dou_ban_movie/douban/movie_card.dart';
import 'package:dou_ban_movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toast/flutter_toast.dart';

class HotMoviesPage extends StatefulWidget {
  @override
  HotMoviesState createState() => new HotMoviesState();
}

class HotMoviesState extends State<HotMoviesPage> {
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
      if (Platform.isIOS) {
        //ios相关代码
      } else if (Platform.isAndroid) {
        FlutterToast.showToast("loading");
      }
      var dio = new Dio();
      Response response = await dio.get(
          "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&start=$start");
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
        FlutterToast.showToast(e.toString());
      }
    }
  }

  Widget buildItem(BuildContext context, int index) {
    if (index == mMovies.length - 1) {
      //已经加载了最后一个元素了，现在加载更多
      _getHotMovies();
    }
    Subjects subjects = mMovies[index];
    return new MovieCard(subjects);
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
