import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(isError
              ? AppLocalizations.of(context)!.errorText
              : AppLocalizations.of(context)!.successText),
          subtitle: Text(message),
        ));
  }
}
