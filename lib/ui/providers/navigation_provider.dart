import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void changeCurrentIndex(int pIndex) {
    _currentIndex = pIndex;
    notifyListeners();
  }
}
