import 'package:flutter/services.dart';

enum FlutterMethod {
  sendAnalytics
}

enum FlutterKeys {
  eventName,
  id
}

class Analytics {
  static const MethodChannel _channel = MethodChannel('museum.list.test/flutter');

  static Future<String> sendAnalytics(String eventName, String id) async {
    return await _channel.invokeMethod(FlutterMethod.sendAnalytics.name, {
      FlutterKeys.eventName.name: eventName,
      FlutterKeys.id.name: id,
    });
  }
}