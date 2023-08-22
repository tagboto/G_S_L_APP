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

// LatLng? _latLngFromString(String? val) {
//   if (val == null) {
//     return null;
//   }
//   final split = val.split(',');
//   final lat = double.parse(split.first);
//   final lng = double.parse(split.last);
//   return LatLng(lat, lng);
// }

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
