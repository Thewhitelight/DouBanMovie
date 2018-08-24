import 'package:cached_network_image/cached_network_image.dart';
import 'package:dou_ban_movie/douban/image_detail.dart';
import 'package:dou_ban_movie/model/movies.dart';
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
        child: new Padding(
            padding: new EdgeInsets.only(left: 16.0, right: 16.0),
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ImageDetail(
                                  widget.subjects.images.large)));
                    },
                    child: new CachedNetworkImage(
                      imageUrl: widget.subjects.images.medium,
                      width: 90.0,
                      height: 160.0,
                    ),
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
                            widget.subjects.title,
                            textAlign: TextAlign.start,
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: new Text(
                            "$average" +
                                " 导演: " +
                                widget.subjects.directors[0].name,
                            textAlign: TextAlign.start,
                            style: new TextStyle(fontSize: 12.0),
                          ),
                        ),
                        new Row(
                          children: buildActors(widget.subjects.casts),
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
                cast.avatars != null
                    ? (cast.avatars.medium != null ? cast.avatars.medium : "")
                    : "",
              ),
            ),
          ),
          new Container(
              width: 45.0,
              height: 20.0,
              margin: new EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
              child: new Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: new Text(
                  cast.name,
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 8.0, color: Colors.black87),
                ),
              )),
        ],
      ));
    }
    return list;
  }
}
