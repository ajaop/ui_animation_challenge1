import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  double opacityValue = 0.05;
  double dismissibleOpacity = 1.0;
  double leftRightPadding = 7.0;
  double bottomPadding = 20.0;
  bool isDismissed = false;

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
}
