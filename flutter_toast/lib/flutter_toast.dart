import 'dart:async';

import 'package:flutter/services.dart';

class FlutterToast {
  static const MethodChannel _channel = const MethodChannel('flutter_toast');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void showToast(String message) {
    _channel.invokeMethod("showToast", {
      "message": message,
    });
  }

  static void showLongToast(String message) {
    _channel.invokeMethod("showLongToast", {
      "message": message,
    });
  }
}
