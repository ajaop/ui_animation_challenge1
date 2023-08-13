import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  double x = 0;
  double y = 0;
  double z = 0;
  double leftPadding = 7.0;
  double bottomPadding = 20.0;
  double opacityValue = 0.05;
  double offsetValue = 0;

  int s = 2;
  int s2 = 3;

  bool swipeRight = false;
  bool isChanged = false;

  Duration animationDuration = const Duration(milliseconds: 100);

  void updateSwipeRight(bool swipe) {
    swipeRight = swipe;
    notifyListeners();
  }

  void updateIsChanged(bool changed) {
    isChanged = changed;
    notifyListeners();
  }

  void updateX(double val) {
    x = val;
    notifyListeners();
  }

  void updateY(double val) {
    y = val;
    notifyListeners();
  }

  void updateZ(double val) {
    z = val;
    notifyListeners();
  }

  void updateLeftPadding(double val) {
    leftPadding = val;
    notifyListeners();
  }

  void updateBottomPadding(double val) {
    bottomPadding = val;
    notifyListeners();
  }

  void updateOpacity(double val) {
    opacityValue = val;
    notifyListeners();
  }

  void updateOffsetValue(double val) {
    offsetValue = val;
    notifyListeners();
  }

  void updateS(int val) {
    s = val;
    notifyListeners();
  }

  void updateS2(int val) {
    s2 = val;
    notifyListeners();
  }

  void updateAnimation(Duration animatedVal) {
    animationDuration = animatedVal;
    notifyListeners();
  }
}
