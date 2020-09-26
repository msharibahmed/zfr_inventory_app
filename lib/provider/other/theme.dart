import 'package:flutter/material.dart';

class ThemeProv with ChangeNotifier {
  bool dayMode = true;

  bool get mode {
    return dayMode;
  }

  void changeMode() {
    if (dayMode) {
      dayMode = false;
    } else {
      dayMode = true;
    }

    notifyListeners();
  }
}
