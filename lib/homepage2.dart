import 'dart:async';

import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List data = [1, 2, 3, 4, 5];

  double x = 0;
  double y = 0;
  double z = 0;
  double leftPadding = 7.0;
  double bottomPadding = 20.0;
  double opacityValue = 0.05;

  @override
  Widget build(BuildContext context) {
    int dataLength = data.length;
    List<Widget> draggableCards = List<Widget>.generate(data.length, (i) {
      if (i == (dataLength - 1)) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 150),
            transformAlignment: Alignment.bottomCenter,
            transform: Matrix4(
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
              x,
              y,
              0,
              1,
            )..rotateZ((z)),
            child: GestureDetector(
              onHorizontalDragStart: (details) {},
              onHorizontalDragUpdate: (details) {
                double position = details.globalPosition.dx;

                if (details.delta.dx > 0) {
                  // Swiping in right direction.
                  if (position > 300 && position < 341) {
                    setState(() {
                      z = 0.2;
                    });
                  } else if (position > 200 && position < 300) {
                    setState(() {
                      z = 0.15;
                      //  x = 40;
                    });
                  } else if (position > 100 && position < 200) {
                    setState(() {
                      z = 0.1;
                      //  x = 60;
                    });
                  } else if (position < 100) {
                    setState(() {
                      z = 0.05;
                    });
                  }
                } else {
                  if (dataLength > 1) {
                    setState(() {
                      x = position + -290;
                      y = -40;
                    });

                    if (position > 300 && position < 341) {
                      setState(() {
                        z = -0.2;
                        leftPadding = 5.25;
                        bottomPadding = 15.0;
                        opacityValue = 0.25;
                      });
                    } else if (position > 200 && position < 300) {
                      setState(() {
                        z = -0.21;
                        leftPadding = 3.5;
                        bottomPadding = 10.0;
                        opacityValue = 0.5;
                      });
                    } else if (position > 100 && position < 200) {
                      setState(() {
                        z = -0.22;
                        leftPadding = 0.75;
                        bottomPadding = 5.0;
                        opacityValue = 0.75;
                      });
                    } else if (position < 100) {
                      setState(() {
                        z = -0.23;
                        leftPadding = 0.0;
                        bottomPadding = 0.0;
                        opacityValue = 1.0;
                      });
                    }
                  }
                }
              },
              onHorizontalDragEnd: (details) {
                if (dataLength > 1) {
                  if (details.velocity == Velocity.zero) {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                      leftPadding = 18.0;
                      bottomPadding = 20.0;
                      opacityValue = 0.05;
                    });
                  } else {
                    setState(() {
                      x = -500;
                      z = 0;
                      y = 0;

                      Future.delayed(Duration(milliseconds: 300), () {
                        setState(() {
                          x = 0;
                          data.removeAt(i);
                        });
                      }).whenComplete(() {
                        setState(() {
                          leftPadding = 10.0;
                          bottomPadding = 20.0;
                          opacityValue = 0.05;
                        });
                      });
                    });
                    // print(dataLength);
                  }
                }
              },
              child: Container(
                color: Colors.black,
                height: 500.0,
              ),
            ),
          ),
        );
      } else {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: (i == 0) ? opacityValue : 0.05,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 100),
              padding: EdgeInsets.only(
                  left: (i == 0) ? (leftPadding * (i + 1)) : (7.0 * (i + 1)),
                  right: (i == 0) ? (leftPadding * (i + 1)) : (7.0 * (i + 1)),
                  bottom:
                      (i == 0) ? (bottomPadding * (i + 1)) : (20.0 * (i + 1))),
              child: Container(color: Colors.black, height: 500.0),
            ),
          ),
        );
      }
    });

    return Scaffold(
      body: Stack(
        children: draggableCards,
      ),
    );
  }
}
