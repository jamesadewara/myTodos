import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';

class PushNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    if (!Platform.isWindows) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      DarwinInitializationSettings initializationSettingsIos =
          const DarwinInitializationSettings();

      LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(
              defaultActionName: 'Push Notification',
              defaultIcon: AssetsLinuxIcon('app_icon'));

      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsIos,
              linux: initializationSettingsLinux);
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );
    }
  }

  Future<void> showNotification() async {
    if (Platform.isWindows) {
      final winNotifyPlugin = WindowsNotification(
          applicationId:
              "r\"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\\WindowsPowerShell\\v1.0\\powershell.exe\"");
      NotificationMessage message = NotificationMessage.fromPluginTemplate(
        "test1",
        "TEXT",
        "TEXT",
        largeImage: 'file_path',
        image: 'file_path',
      );
      winNotifyPlugin.showNotificationPluginTemplate(message);
    } else {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'your_channel_id',
        'your_channel_name',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
        'New Notification',
        'Tap to navigate to a specific page',
        platformChannelSpecifics,
        payload: 'page_id',
      );
    }
  }
}
