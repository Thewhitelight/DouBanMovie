import 'package:dou_ban_movie/douban_hot_movies.dart';
import 'package:dou_ban_movie/douban_top_movies.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
