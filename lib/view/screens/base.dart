import 'package:flutter/material.dart';
import 'package:mytodo/control/app_notification/push_notification.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:mytodo/control/app_notification/windows_notification.dart';
// import 'package:mytodo/model/states/state_management.dart';
// import 'package:mytodo/view/custom_widgets/dropdown_modal.dart';
// import 'package:mytodo/control/notifier_listener.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mytodo/control/store/actions.dart';
// import 'package:mytodo/control/store/store.dart';

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
    // final PushNotification pushNotification = PushNotification();
    // String listener = context.watch<NotifyListener>().message;
    // LoadingManagerState loadingState = context.watch<LoadingManagerState>();
    PushNotification();
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
        title: const Text('Oops'),
      ),
      body: const Center(
        child: Text(
          'Oops, something went wrong. Please try again or go back to your previous page',
          softWrap: true,
        ),
      ),
    );
  }
}
