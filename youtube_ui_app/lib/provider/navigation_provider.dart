import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _indexBottomNavigation = 0;

  void onChangeIndex(int index) {
    _indexBottomNavigation = index;
    notifyListeners();
  }

  int get indexSelected => _indexBottomNavigation;
}
