import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MessageSnackbar extends StatelessWidget {
  final bool isError;
  final String message;
  const MessageSnackbar(
      {super.key, required this.isError, required this.message});

  @override
  SnackBar build(BuildContext context) {
    return SnackBar(
        backgroundColor: Theme.of(context).splashColor,
        content: ListTile(
          title: Text(
              isError ? context.tr("errorText") : context.tr("successText")),
          subtitle: Text(message),
        ));
  }
}
