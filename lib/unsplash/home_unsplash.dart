import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dou_ban_movie/model/unsplash/image_item.dart';
import 'package:dou_ban_movie/unsplash/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toast/flutter_toast.dart';

class HomeUnSplash extends StatefulWidget {
  @override
  HomeUnSplashState createState() => new HomeUnSplashState();
}

class HomeUnSplashState extends State<HomeUnSplash> {
  int page = 1;
  List<ImageItem> mImages = new List();
  bool canLoad = true;

  @override
  void initState() {
    super.initState();
    _getSplash();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: mImages.length,
        itemBuilder: buildItem);
  }

  _getSplash() async {
    FlutterToast.showToast("loading");
    var dio = new Dio();
    Response response = await dio.get(
        "https://api.unsplash.com/photos/?client_id=f7072aa2161696bb841afaad107b05d75efff90e9d8cfd2ccd9accc6a198ed15&page=$page");
    try {
      List<ImageItem> items = new List();
      if (response.data != null) {
        response.data.forEach((v) {
          items.add(new ImageItem.fromJson(v));
        });
      }
      if (response.statusCode == HttpStatus.OK) {
        setState(() {
          this.mImages.addAll(items);
          this.page++;
        });
      } else {
        FlutterToast.showToast("网络错误");
      }
    } catch (e) {
      FlutterToast.showToast(e.toString());
      print(e.toString());
    }
  }

  Widget buildItem(BuildContext context, int index) {
    if (index == mImages.length - 1) {
      //已经加载了最后一个元素了，现在加载更多
      _getSplash();
    }
    ImageItem imageItem = mImages[index];
    return new ImageCard(imageItem);
  }

/* void showNetWorkErr(e) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Container(
              width: 100.0,
              height: 100.0,
              padding: const EdgeInsets.all(16.0),
              child: new Center(
                child: AlertDialog(
                  content: Text(e.toString()),
                ),
              ),
            ));
  }*/
}
