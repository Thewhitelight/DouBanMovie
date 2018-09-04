import 'package:dou_ban_movie/douban/image_detail.dart';
import 'package:dou_ban_movie/douban/util.dart';
import 'package:dou_ban_movie/model/unsplash/image_item.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  final ImageItem imageItem;

  ImageCard(this.imageItem);

  @override
  State<StatefulWidget> createState() {
    return new ImageCardState();
  }
}

class ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    double ratio = widget.imageItem.width / widget.imageItem.height;
    return new GestureDetector(
      onTap: () {
        Util.routerImageDetail(
            context, new ImageDetail(imageUrl: widget.imageItem.urls.full));
      },
      child: new Card(
        elevation: 5.0,
        child: new Container(
          width: 360.0,
          height: (360 / ratio),
          child: new Image.network(
            widget.imageItem.urls.regular,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
