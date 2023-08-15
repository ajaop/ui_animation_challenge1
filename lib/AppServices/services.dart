import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/card_providers.dart';

class Services {
  final BuildContext context;
  final ScrollController scrollController;

  Services(this.context, this.scrollController);

  void swipingRight(double position) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    if (updateCardProvider.isChanged == false) {
      updateCardProvider.updateSwipeRight(true);
      updateCardProvider.updateS(updateCardProvider.s - 1);
      updateCardProvider.updateS2(updateCardProvider.s2 - 1);
      updateCardProvider.updateIsChanged(true);
    }

    if (position > 300 && position < 341) {
      updateCardProvider.updateX(0);
      updateCardProvider.updateY(0);
      updateCardProvider.updateZ(0);
      updateCardProvider.updateLeftPadding(10.0);
      updateCardProvider.updateBottomPadding(20.0);
      updateCardProvider.updateOpacity(0.05);
    } else if (position > 200 && position < 300) {
      updateCardProvider.updateX(position);
      updateCardProvider.updateY(-5);
      updateCardProvider.updateZ(-0.05);
      updateCardProvider.updateLeftPadding(8.0);
      updateCardProvider.updateBottomPadding(15.0);
      updateCardProvider.updateOpacity(0.1);
    } else if (position > 100 && position < 200) {
      updateCardProvider.updateAnimation(const Duration(milliseconds: 100));
      updateCardProvider.updateX(position);
      updateCardProvider.updateY(-10);
      updateCardProvider.updateZ(-0.1);
      updateCardProvider.updateLeftPadding(4.0);
      updateCardProvider.updateBottomPadding(10.0);
      updateCardProvider.updateOpacity(0.5);
    } else if (position < 100) {
      updateCardProvider.updateAnimation(Duration.zero);
      updateCardProvider.updateLeftPadding(0.0);
      updateCardProvider.updateBottomPadding(0.0);
      updateCardProvider.updateOpacity(0.9);
      updateCardProvider.updateX(-300);
      updateCardProvider.updateY(-40);
      updateCardProvider.updateZ(-0.23);
    }
  }

  void swipingLeft(double position) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    if (updateCardProvider.isChanged == false) {
      updateCardProvider.updateSwipeRight(false);
      updateCardProvider.updateIsChanged(true);
    }
    updateCardProvider.updateX(position + -290);
    updateCardProvider.updateY(-40);

    if (position > 300 && position < 341) {
      updateCardProvider.updateZ(-0.2);
      updateCardProvider.updateLeftPadding(5.25);
      updateCardProvider.updateBottomPadding(15.0);
      updateCardProvider.updateOpacity(0.2);
    } else if (position > 200 && position < 300) {
      updateCardProvider.updateZ(-0.21);
      updateCardProvider.updateLeftPadding(3.5);
      updateCardProvider.updateBottomPadding(10.0);
      updateCardProvider.updateOpacity(0.5);
    } else if (position > 100 && position < 200) {
      updateCardProvider.updateZ(-0.22);
      updateCardProvider.updateLeftPadding(0.75);
      updateCardProvider.updateBottomPadding(5.0);
      updateCardProvider.updateOpacity(0.75);
    } else if (position < 100) {
      updateCardProvider.updateZ(-0.23);
      updateCardProvider.updateLeftPadding(0.0);
      updateCardProvider.updateBottomPadding(0.0);
      updateCardProvider.updateOpacity(1.0);
    }
  }

  void swipeRightEnd(DragEndDetails details) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    updateCardProvider.updateIsChanged(false);
    updateCardProvider.updateX(0);
    updateCardProvider.updateY(0);
    updateCardProvider.updateZ(0);
    updateCardProvider.updateOpacity(0);

    _animateToIndex(updateCardProvider.s);
  }

  void swipeLeftEnd(DragEndDetails details) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    updateCardProvider.updateIsChanged(false);
    if (details.velocity == Velocity.zero) {
      //swipe left direction
      updateCardProvider.updateX(0);
      updateCardProvider.updateY(0);
      updateCardProvider.updateZ(0);
      updateCardProvider.updateLeftPadding(18.0);
      updateCardProvider.updateBottomPadding(20.0);
      updateCardProvider.updateOpacity(0.05);
    } else {
      updateCardProvider.updateX(-500);
      updateCardProvider.updateY(0);
      updateCardProvider.updateZ(0);
      updateCardProvider.updateS(updateCardProvider.s + 1);

      Future.delayed(const Duration(milliseconds: 50), () {
        updateCardProvider.updateAnimation(Duration.zero);
      }).whenComplete(() {
        updateCardProvider.updateX(0);
        updateCardProvider.updateLeftPadding(10.0);
        updateCardProvider.updateBottomPadding(20.0);
        updateCardProvider.updateOpacity(0.05);
        updateCardProvider.updateS2(updateCardProvider.s2 + 1);
      });

      _animateToIndex(updateCardProvider.s);
    }
  }

  void dragUp(AnimationController _controller) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);

    if (updateCardProvider.isChanged == false) {
      updateCardProvider.updateSwipeUp(true);
      updateCardProvider.updateIsChanged(true);
      _playAmination(_controller);
    }
  }

  void dragUpEnd() {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    updateCardProvider.updateIsChanged(false);
  }

  void dragDown(AnimationController _controller) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    if (updateCardProvider.isChanged == false) {
      updateCardProvider.updateSwipeUp(false);
      updateCardProvider.updateIsChanged(true);
      _reverseAmination(_controller);
    }
  }

  void dragDownEnd() {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    updateCardProvider.updateIsChanged(false);
  }

  void _animateToIndex(int index) {
    CardProvider updateCardProvider =
        Provider.of<CardProvider>(context, listen: false);
    if (updateCardProvider.swipeRight == false) {
      updateCardProvider
          .updateOffsetValue(updateCardProvider.offsetValue += 107.0);
    } else {
      updateCardProvider
          .updateOffsetValue(updateCardProvider.offsetValue -= 107.0);
    }

    scrollController.animateTo(
      updateCardProvider.offsetValue,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void checkHeightValue() {}

  Future<void> _playAmination(AnimationController _controller) async {
    try {
      await _controller.forward().orCancel;
      //await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _reverseAmination(AnimationController _controller) async {
    try {
      await _controller.reverse().orCancel;
      //await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }
}
