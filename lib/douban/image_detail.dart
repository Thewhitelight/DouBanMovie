import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatefulWidget {
  final String imageUrl;

  const ImageDetail(this.imageUrl);

  @override
  ImageDetailState createState() => new ImageDetailState();
}

class ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("图片详情"),
      ),
      body: new Center(
        child: new CachedNetworkImage(
          imageUrl: widget.imageUrl, fit: BoxFit.fill,),
      ),
    );
  }
}
