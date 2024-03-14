import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class BackgroundService {
  static const MethodChannel _channel = MethodChannel('background_service');

  static Future<void> initialize({Function? callback}) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Run app as a startup app
    await _runOnStartup();

    // Initialize background tasks based on platform
    if (Platform.isAndroid) {
      await _initializeAndroid(callback: callback);
    } else if (Platform.isIOS) {
      await _initializeIOS(callback: callback);
    } else if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      await _initializeOthers(callback: callback);
    }
  }

  static Future<void> _runOnStartup() async {
    // Run app as a startup app
    await _channel.invokeMethod('runOnStartup');
  }

  static Future<void> _initializeAndroid({Function? callback}) async {
    // Initialize background tasks for Android
    await _channel.invokeMethod('initializeAndroid');
    _startBackgroundTask(callback);
  }

  static Future<void> _initializeIOS({Function? callback}) async {
    // Initialize background tasks for iOS
    await _channel.invokeMethod('initializeIOS');
    _startBackgroundTask(callback);
  }

  static Future<void> _initializeOthers({Function? callback}) async {
    // Initialize background tasks for macOS, Linux, and Windows
    _startBackgroundTask(callback);
  }

  static void _startBackgroundTask(Function? callback) {
    // Start background task
    Timer.periodic(Duration(minutes: 15), (Timer t) {
      // Your background task logic here
      print('Background task executed');
      callback?.call();
    });
  }
}
