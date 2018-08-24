import 'package:dou_ban_movie/douban/douban_hot_movies.dart';
import 'package:dou_ban_movie/douban/douban_top_movies.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int mCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Douban Movies"),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.all_inclusive), title: new Text('HOT')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.favorite), title: new Text('TOP'))
        ],
        currentIndex: mCurrentIndex,
        onTap: (index) {
          setState(() {
            mCurrentIndex = index;
          });
        },
      ),
      body: _setupCurrentPage(mCurrentIndex),
    );
  }

  Widget _setupCurrentPage(int mCurrentIndex) {
    switch (mCurrentIndex) {
      case 0:
        return new HotMoviesPage();
      case 1:
        return new TopMoviesPage();
      default:
        return new HotMoviesPage();
    }
  }
}
