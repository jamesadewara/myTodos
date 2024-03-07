// ignore_for_file: use_build_context_synchronously, unused_element

import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int id = 0;

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

class PushNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initNotifications() async {
    // _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation()
    if (!Platform.isWindows) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');

      final List<DarwinNotificationCategory> darwinNotificationCategories =
          <DarwinNotificationCategory>[
        DarwinNotificationCategory(
          darwinNotificationCategoryText,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.text(
              'text_1',
              'Action 1',
              buttonTitle: 'Send',
              placeholder: 'Placeholder',
            ),
          ],
        ),
        DarwinNotificationCategory(
          darwinNotificationCategoryPlain,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain(
              'id_2',
              'Action 2 (destructive)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
            DarwinNotificationAction.plain(
              navigationActionId,
              'Action 3 (foreground)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
            DarwinNotificationAction.plain(
              'id_4',
              'Action 4 (auth required)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.authenticationRequired,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        )
      ];

      DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
          didReceiveLocalNotificationStream.add(
            ReceivedNotification(
              id: id,
              title: title,
              body: body,
              payload: payload,
            ),
          );
        },
        notificationCategories: darwinNotificationCategories,
      );

      LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(
              defaultActionName: 'Push Notification',
              defaultIcon: AssetsLinuxIcon('app_icon'));

      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsDarwin,
              macOS: initializationSettingsDarwin,
              linux: initializationSettingsLinux);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings
          // onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
          //     (NotificationResponse notificationResponse) {
          //   switch (notificationResponse.notificationResponseType) {
          //     case NotificationResponseType.selectedNotification:
          //       selectNotificationStream.add(notificationResponse.payload);
          //       break;
          //     case NotificationResponseType.selectedNotificationAction:
          //       if (notificationResponse.actionId == navigationActionId) {
          //         selectNotificationStream.add(notificationResponse.payload);
          //       }
          //       break;
          //   }
          // },
          // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
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
      const AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails('your channel id', 'your channel name',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker');

      const DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails();

      const LinuxNotificationDetails linuxNotificationDetails =
          LinuxNotificationDetails();

      const NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          macOS: darwinNotificationDetails,
          iOS: darwinNotificationDetails,
          linux: linuxNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          0, 'plain title', 'plain body', notificationDetails,
          payload: 'item x');
    }
  }
}

void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint("notification payload: $payload");
  }
}
