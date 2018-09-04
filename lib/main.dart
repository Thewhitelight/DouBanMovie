import 'package:dou_ban_movie/douban/home_movie.dart';
import 'package:dou_ban_movie/unsplash/home_unsplash.dart';
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
      appBar: new AppBar(
        title: new Text("Douban Movies"),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.all_inclusive), title: new Text('电影')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.favorite), title: new Text('Unsplash'))
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
        return new HomeMovie();
      case 1:
        return new HomeUnSplash();
      default:
        return new HomeMovie();
    }
  }
}
