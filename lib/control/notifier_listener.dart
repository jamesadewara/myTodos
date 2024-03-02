import 'package:flutter/material.dart';

class NotifyListener extends ChangeNotifier {
  String _message = "";
  String get message => _message;

  void setLoading({required bool value, String? message}) {
    _message = message ?? "Loading...";
    notifyListeners();
  }

  void onChange() {
    notifyListeners();
  }
}
