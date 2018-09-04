import 'package:dou_ban_movie/douban/image_detail.dart';
import 'package:dou_ban_movie/douban/util.dart';
import 'package:dou_ban_movie/model/movie/casts.dart';
import 'package:flutter/material.dart';

class Avatars extends StatefulWidget {
  final List<Casts> casts;

  Avatars(this.casts);

  @override
  AvatarsState createState() => AvatarsState();
}

class AvatarsState extends State<Avatars> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: buildActors(widget.casts),
    );
  }

  List<Widget> buildActors(List<Casts> casts) {
    List<Widget> list = new List();
    for (Casts cast in casts) {
      list.add(
        new GestureDetector(
          onTap: () {
            Util.routerImageDetail(
                context,
                new ImageDetail(
                  imageUrl: cast.avatars != null
                      ? (cast.avatars.large != null ? cast.avatars.large : "")
                      : "",
                  title: cast.name,
                ));
          },
          child: new Column(
            children: <Widget>[
              new Container(
                width: 45.0,
                height: 45.0,
                margin: new EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                    cast.avatars != null
                        ? (cast.avatars.medium != null
                            ? cast.avatars.medium
                            : "")
                        : "",
                  ),
                ),
              ),
              new Container(
                  width: 45.0,
                  height: 20.0,
                  margin: new EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 8.0),
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: new Text(
                      cast.name,
                      textAlign: TextAlign.center,
                      style:
                          new TextStyle(fontSize: 8.0, color: Colors.black87),
                    ),
                  )),
            ],
          ),
        ),
      );
    }
    return list;
  }
}
