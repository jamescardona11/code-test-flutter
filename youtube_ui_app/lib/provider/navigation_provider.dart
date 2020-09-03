import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _indexBottomNavigation = 0;
  PageController _controller = PageController(initialPage: 0);

  void onChangeIndex(int index) {
    _indexBottomNavigation = index;
    _controller.jumpToPage(index);
    notifyListeners();
  }

  int get indexSelected => _indexBottomNavigation;
  PageController get controller => _controller;
}
