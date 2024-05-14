import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  static final HomeController instance = HomeController();

  int _currentDrawer = 0;

  int get getCurrentDrawer => _currentDrawer;

  void setCurrentDrawer(int value) {
    _currentDrawer = value;
    notifyListeners();
  }
}
