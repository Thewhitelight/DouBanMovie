import 'package:flutter/material.dart';

class Util {
  static FadeTransition _createImageTransition(
      Animation<double> animation, Widget child) {
    return new FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static SlideTransition _createDetailTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }

  static void routerImageDetail(BuildContext context, Widget target) {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          return target;
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return _createImageTransition(animation, child);
        }));
  }

  static void router(BuildContext context, Widget target) {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          return target;
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return _createDetailTransition(animation, child);
        }));
  }
}
