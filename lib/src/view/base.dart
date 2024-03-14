import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // PushNotification pushNotification = PushNotification();
    // pushNotification.showNotification();
    // loadingState.isLoading
    //     ? showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return ProgressModal(message: listener);
    //         })
    //     : null;
    return child;
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
              GoRouter.of(context).pop();
            },
          ),
          title: Text(
            context.tr('oopsText'),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/error.png",
            width: 64,
            height: 64,
          ),
          const SizedBox(
            height: 16,
          ),
          AutoSizeText(
            context.tr('oopsDetailText'),
            style: Theme.of(context).textTheme.headlineMedium,
            softWrap: true,
          )
        ],
      ),
    );
  }
}
