import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final String id;

  const MovieDetail(this.id);

  @override
  MovieDetailState createState() => new MovieDetailState();
}

class MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("电影详情"),
      ),
      body: new Center(
        child: new Text(widget.id),
      ),
    );
  }
}
