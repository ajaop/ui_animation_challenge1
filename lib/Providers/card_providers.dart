import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  late Animation<double> rightPadding;
  late Animation<double> leftPadding;

  void updateRightPadding(Animation<double> right) {
    rightPadding = right;
    notifyListeners();
  }

  void updateLeftPadding(Animation<double> left) {
    leftPadding = left;
    notifyListeners();
  }
}
