import 'package:flutter/material.dart';

class GSLAppState extends ChangeNotifier {
  static final GSLAppState _instance = GSLAppState._internal();

  factory GSLAppState() {
    return _instance;
  }

  GSLAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _categoryName = '';
  String get categoryName => _categoryName;
  set categoryName(String _value) {
    _categoryName = _value;
  }
}

