import 'package:flutter/material.dart';

class BottomBarModel with ChangeNotifier {
  int _currentIndex = 0;
  bool _showCustomBottomBar = false;

  int get currentIndex => _currentIndex;
  bool get showCustomBottomBar => _showCustomBottomBar;

  void changeBottomBar(int index) {
    _currentIndex = index;
    _showCustomBottomBar = !_showCustomBottomBar; // 디자인 변경 여부
    notifyListeners();
  }
}
