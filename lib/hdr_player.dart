
import 'dart:async';

import 'package:flutter/services.dart';

class HdrPlayer {
  static const MethodChannel _channel = MethodChannel('hdr_player');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
