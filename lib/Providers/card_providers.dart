import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  Duration animationDuration = const Duration(milliseconds: 100);
  bool swipeRight = false;
  double x = 0;
  double y = 0;
  double z = 0;
  int s = 2;
  int s2 = 3;
  double offsetValue = 0;
  Matrix4 matrix = Matrix4(
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    1,
  );
}
