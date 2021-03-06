import 'package:dou_ban_movie/douban/avatars.dart';
import 'package:dou_ban_movie/douban/image_detail.dart';
import 'package:dou_ban_movie/douban/movie_detail.dart';
import 'package:dou_ban_movie/douban/util.dart';
import 'package:dou_ban_movie/model/movie/movies.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final Subjects subjects;

  const MovieCard(this.subjects);

  @override
  MovieCardState createState() => MovieCardState();
}

class MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    dynamic average = widget.subjects.rating.average;
    return new Card(
      elevation: 0.5,
      margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: new InkWell(
        onTap: () {
          Util.router(context, new MovieDetail(widget.subjects.id));
        },
        child: new Padding(
            padding: new EdgeInsets.only(left: 16.0, right: 16.0),
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Util.routerImageDetail(
                          context,
                          new ImageDetail(
                              imageUrl: widget.subjects.images.large));
                    },
                    child: new Padding(
                      padding: new EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: new Container(
                        width: 90.0,
                        height: 160.0,
                        child: Image.network(widget.subjects.images.medium),
                      ),
                    ),
                  ),
                  new Container(
                    width: 190.0,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          widget.subjects.title,
                          textAlign: TextAlign.start,
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Text(
                          "$average" +
                              "  导演: " +
                              widget.subjects.directors[0].name,
                          textAlign: TextAlign.start,
                          style: new TextStyle(fontSize: 12.0),
                        ),
                        new Avatars(widget.subjects.casts),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
