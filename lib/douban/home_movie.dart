import 'package:dou_ban_movie/douban/douban_hot_movies.dart';
import 'package:dou_ban_movie/douban/douban_top_movies.dart';
import 'package:flutter/material.dart';

class HomeMovie extends StatefulWidget {
  @override
  _HomeMovieState createState() => new _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new TabBar(
            tabs: [
              new Text(
                "最新",
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                "Top250",
                style: new TextStyle(fontSize: 20.0),
              )
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.0,
          ),
        ),
        body: new TabBarView(children: [
          new HotMoviesPage(),
          new TopMoviesPage(),
        ]),
      ),
    );
  }
}
