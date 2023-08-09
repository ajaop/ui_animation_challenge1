import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  double opacityValue = 0.05;
  double dismissibleOpacity = 1.0;
  double leftRightPadding = 7.0;
  double bottomPadding = 20.0;
  double rightPosition = 5.0;
  bool isDismissed = false;
  double x = 0;
  double y = 0;
  double z = 0;

  void updateOpacity(double opacity) {
    opacityValue = opacity;
    notifyListeners();
  }

  void updateDismissibleOpacity(double opacity) {
    dismissibleOpacity = opacity;
    notifyListeners();
  }

  void updateIsDismissed() {
    isDismissed = !isDismissed;
    notifyListeners();
  }

  void updateLeftRightPadding(double padding) {
    leftRightPadding = padding;
    notifyListeners();
  }

  void updateBottomPadding(double padding) {
    bottomPadding = padding;
    notifyListeners();
  }

  void updateX(double position) {
    x = position;
    notifyListeners();
  }

  void updateY(double position) {
    y = position;
    notifyListeners();
  }
}
