import 'package:flutter/material.dart';

import '../../AppServices/services.dart';
import '../../Models/card_details.dart';
import '../../Providers/card_providers.dart';
import '../MainCard/main_card_widget.dart';

class MainCardAnimation extends StatelessWidget {
  MainCardAnimation(
      {Key? key,
      required this.cardProvider,
      required this.s,
      required this.services,
      required this.carList,
      required this.swipeRight,
      required this.animationController})
      : height = Tween<double>(begin: 665.0, end: 1000.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.005,
              0.2,
              curve: Curves.easeIn,
            ),
          ),
        ),
        sizedBoxHeight = Tween<double>(begin: 20.0, end: 60.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.2,
              0.35,
              curve: Curves.bounceInOut,
            ),
          ),
        ),
        stop1 = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.32,
              0.735,
              curve: Curves.ease,
            ),
          ),
        ),
        stop2 = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.42,
              0.735,
              curve: Curves.ease,
            ),
          ),
        )
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward ||
                status == AnimationStatus.reverse) {
              cardProvider.updateBackArrowColor(Colors.grey[100]!);
            } else if (status == AnimationStatus.completed ||
                status == AnimationStatus.dismissed) {
              cardProvider.updateBackArrowColor(const Color(0xff0D0D0D));
            }
          })
          ..addListener(() {}),
        textColor = ColorTween(
          begin: Colors.grey[100],
          end: Color(0xff0D0D0D),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.500,
              0.720,
              curve: Curves.ease,
            ),
          ),
        ),
        height2 = Tween<double>(begin: 300.0, end: 30.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.725,
              0.9,
              curve: Curves.ease,
            ),
          ),
        ),
        sizedBoxHeight2 = Tween<double>(begin: 44.0, end: 85.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.5,
              0.65,
              curve: Curves.bounceInOut,
            ),
          ),
        ),
        imageShadowOpacity = Tween<double>(begin: 0.05, end: 0.7).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.45,
              0.67,
              curve: Curves.easeIn,
            ),
          ),
        ),
        imageMatrix = Tween<Matrix4>(
            begin: Matrix4(
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
            ),
            end: Matrix4(
              1.7,
              0,
              0,
              0,
              0,
              1.3,
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
            )).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.45,
              0.71,
              curve: Curves.easeIn,
            ),
          ),
        ),
        super(key: key);

  final CardProvider cardProvider;
  final int s;
  final Services services;
  final List<CardDetails> carList;
  final bool swipeRight;
  final AnimationController animationController;
  final Animation<double> height;
  final Animation<double> height2;
  final Animation<double> sizedBoxHeight;
  final Animation<double> sizedBoxHeight2;
  final Animation<double> stop1;
  final Animation<double> stop2;
  final Animation<Color?> textColor;
  final Animation<double> imageShadowOpacity;
  final Animation<Matrix4> imageMatrix;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return MainCardWidget(
              cardProvider: cardProvider,
              s: s,
              services: services,
              carList: carList,
              swipeRight: swipeRight,
              animationController: animationController,
              stop1: stop1,
              stop2: stop2,
              height: height,
              sizedBoxHeight: sizedBoxHeight,
              textColor: textColor,
              imageMatrix: imageMatrix,
              imageShadowOpacity: imageShadowOpacity,
              sizedBoxHeight2: sizedBoxHeight2,
              height2: height2);
        });
  }
}
