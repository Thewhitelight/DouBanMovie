import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatefulWidget {
  final String imageUrl;
  final String title;

  const ImageDetail({Key key, @required this.imageUrl, this.title});

  @override
  ImageDetailState createState() => new ImageDetailState();
}

class ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title == null ? "图片详情" : widget.title),
      ),
      body: new Center(
        child: new CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
