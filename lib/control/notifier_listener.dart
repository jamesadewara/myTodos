import 'package:flutter/material.dart';

class NotifyListener extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _message = "";
  String get message => _message;

  void setLoading({required bool value, String? message}) {
    _isLoading = value;
    _message = message ?? "Loading...";
    notifyListeners();
  }

  void onChange() {
    notifyListeners();
  }
}
