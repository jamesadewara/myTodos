import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

String? validateField(value, {required BuildContext context}) {
  if (value.length < 4) {
    return context.tr("validateFieldText", namedArgs: {"value": 4.toString()});
  }

  return null;
}

String? validateDropdownField(value, {required BuildContext context}) {
  if (value.length == 0) {
    return context.tr("validateDropdownFieldText");
  }

  return null;
}

String? validateUserName(value, {required BuildContext context}) {
  if (value == null || value.isEmpty) {
    return context.tr("validateUserNameText");
  }
  return null;
}

String? validateIsEmpty(String value, {required BuildContext context}) {
  if (value.isEmpty) {
    return context.tr("validateIsEmptyText");
  }
  return null;
}

String? validateAtLeast(String value, int nChars,
    {required BuildContext context}) {
  if (value.length < nChars) {
    return context
        .tr("validateAtLeastText", namedArgs: {"value": nChars.toString()});
  }
  return null;
}

String? validateUserEmail(value, {required BuildContext context}) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? context.tr("validateUserEmailText")
      : validateIsEmpty(value, context: context);
}

String? validateUserPassword(value, {required BuildContext context}) {
  if (value.length < 9) {
    return context
        .tr("validateUserPasswordText", namedArgs: {"value": 8.toString()});
  }
  return null;
}

String? validateUserPasswordConfirmation(value, value2,
    {required BuildContext context}) {
  if (value != value2) {
    return context.tr("validatePasswordText");
  }
  return null;
}

String? noSpacesUrl(value, {required BuildContext context}) {
  String portfolioName =
      value.toString().replaceAll(RegExp(r' '), '_').toLowerCase();

  return portfolioName;
}
