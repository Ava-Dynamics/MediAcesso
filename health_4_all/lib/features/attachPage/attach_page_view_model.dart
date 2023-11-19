import 'package:flutter/material.dart';

class AttachPageViewModel extends ChangeNotifier {
  String _displayText = 'Hello, World!';

  String get displayText => _displayText;

  void updateText() {
    _displayText = 'Button Pressed!';
    notifyListeners();
  }
}
