import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set setcurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}