import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mytodo/src/control/features/app_notification/push_notification.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  Widget build(BuildContext context) {
    // String listener = context.watch<NotifyListener>().message;
    // LoadingManagerState loadingState = context.watch<LoadingManagerState>();
    PushNotification pushNotification = PushNotification();
    pushNotification.showNotification();
    // loadingState.isLoading
    //     ? showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return ProgressModal(message: listener);
    //         })
    //     : null;
    return widget.child;
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            context.tr('oopsText'),
          )),
      body: Center(
        child: Text(
          context.tr('oopsDetailText'),
          softWrap: true,
        ),
      ),
    );
  }
}
