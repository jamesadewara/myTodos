import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(context.tr("loginDialogTitle")),
      content: Text(context.tr("loginDialogSubtitle")),
      actions: <Widget>[
        TextButton(
          child: Text(context.tr("cancelText")),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        TextButton(
          child: Text(context.tr("okText")),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }
}
