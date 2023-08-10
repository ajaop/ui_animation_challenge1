import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final ScrollController scrollController = ScrollController();
  List data = ['', '', '1950', '1961', '1962', '1953', '1954', '', ''];
  double x = 0;
  double y = 0;
  double z = 0;
  double leftPadding = 7.0;
  double bottomPadding = 20.0;
  double opacityValue = 0.05;
  Duration animationDuration = Duration(milliseconds: 100);
  bool swipeRight = false;
  int s = 2;
  double offsetValue = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() {
  //     // print(scrollController.offset); // <-- This is it.
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> draggableCards = List<Widget>.generate(5, (i) {
      if (i == (5 - 1)) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: animationDuration,
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
              onHorizontalDragUpdate: (details) {
                double position = details.globalPosition.dx;
                if (details.delta.dx > 0 && s >= 3) {
                  // Swiping in right direction.
                  setState(() {
                    swipeRight = true;
                  });
                  if (position > 300 && position < 341) {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                      leftPadding = 10.0;
                      bottomPadding = 20.0;
                      opacityValue = 0.05;
                    });
                  } else if (position > 200 && position < 300) {
                    setState(() {
                      x = position;
                      y = -5;
                      z = -0.05;
                      leftPadding = 8.0;
                      bottomPadding = 15.0;
                      opacityValue = 0.1;
                    });
                  } else if (position > 100 && position < 200) {
                    setState(() {
                      animationDuration = const Duration(milliseconds: 100);
                      x = position;
                      y = -10;
                      z = -0.1;
                      leftPadding = 4.0;
                      bottomPadding = 10.0;
                      opacityValue = 0.5;
                    });
                  } else if (position < 100) {
                    setState(() {
                      animationDuration = Duration.zero;
                      leftPadding = 0.0;
                      bottomPadding = 0.0;
                      opacityValue = 0.9;
                      x = -300;
                      y = -40;
                      z = -0.23;
                    });
                  }
                } else if (details.delta.dx < 0 && s <= (data.length - 4)) {
                  //swipe left direction
                  setState(() {
                    swipeRight = false;
                  });
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
              },
              onHorizontalDragEnd: (details) {
                if (swipeRight == false && s <= (data.length - 4)) {
                  if (details.velocity == Velocity.zero) {
                    //swipe left direction
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
                      s += 1;
                    });
                    Future.delayed(const Duration(milliseconds: 200), () {
                      setState(() {
                        x = 0;
                      });
                    }).whenComplete(() {
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          leftPadding = 10.0;
                          bottomPadding = 20.0;
                          opacityValue = 0.05;
                        });
                      });
                    });

                    _animateToIndex(s);
                  }
                } else if (swipeRight == true && s >= 3) {
                  //swipe right direction
                  setState(() {
                    x = 0;
                    y = 0;
                    z = 0;
                    opacityValue = 0;
                    s -= 1;
                  });
                  _animateToIndex(s);
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: 620.0,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.grey[600],
                      thickness: 4.1,
                      indent: 190.0,
                      endIndent: 190.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: animationDuration,
            opacity: (i == 0) ? opacityValue : 0.05,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 100),
              padding: EdgeInsets.only(
                  left: (i == 0) ? (leftPadding * (i + 1)) : (7.0 * (i + 1)),
                  right: (i == 0) ? (leftPadding * (i + 1)) : (7.0 * (i + 1)),
                  bottom:
                      (i == 0) ? (bottomPadding * (i + 1)) : (10.0 * (i + 1))),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 620.0),
            ),
          ),
        );
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Stack(children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('Timeline',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold)),
                  )
                ]),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SafeArea(
                        left: false,
                        right: false,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Container(
                            width: 76,
                            transform: Matrix4.translationValues(-32, 0, 0),
                            child: Text(
                              data[index].toString(),
                              style: data[s].toString == data[index].toString
                                  ? TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Oxygen',
                                    )
                                  : TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Oxygen',
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 0.5
                                        ..color = Colors.black,
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: draggableCards,
          ),
        ],
      ),
    );
  }

  void _animateToIndex(int index) {
    if (swipeRight == false) {
      setState(() {
        offsetValue += 107.0;
      });
    } else {
      setState(() {
        offsetValue -= 107.0;
      });
    }

    scrollController.animateTo(
      offsetValue,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }
}
