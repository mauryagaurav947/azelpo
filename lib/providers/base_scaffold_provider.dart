import 'package:flutter/material.dart';

class SetupFlowProvider extends ChangeNotifier {
  int _currentBottomBarIndex = 0;

  int get currentBottomBarIndex => _currentBottomBarIndex;

  set changeIndex(int index) {
    if (_currentBottomBarIndex != index) {
      _currentBottomBarIndex = index;
      notifyListeners();
    }
  }
}
