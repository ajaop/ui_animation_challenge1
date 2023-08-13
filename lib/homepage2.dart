import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_animation_challenge1/Models/card_details.dart';
import 'package:ui_animation_challenge1/Providers/card_providers.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final ScrollController scrollController = ScrollController();

  double offsetValue = 0;

  late CardProvider updateCardProvider;

  List data = ['', '', '1960', '1961', '1962', '1963', '1964', '', ''];
  final List<CardDetails> carList = [
    CardDetails(startYear: '', endYear: '', carImage: '', carName: ''),
    CardDetails(startYear: '', endYear: '', carImage: '', carName: ''),
    CardDetails(
        startYear: '1960',
        endYear: '1982',
        carImage: 'images/car1.jpg',
        carName: 'Chevrolet Corvette C3'),
    CardDetails(
        startYear: '1961',
        endYear: '1983',
        carImage: 'images/car2.jpg',
        carName: 'Chevrolet Corvette C1'),
    CardDetails(
        startYear: '1962',
        endYear: '1984',
        carImage: 'images/car3.jpg',
        carName: 'Chevrolet Corvette C3'),
    CardDetails(
        startYear: '1963',
        endYear: '1985',
        carImage: 'images/car1.jpg',
        carName: 'Chevrolet Corvette C1'),
    CardDetails(
        startYear: '1964',
        endYear: '1986',
        carImage: 'images/car2.jpg',
        carName: 'Chevrolet Corvette C3'),
    CardDetails(
        startYear: '1965',
        endYear: '1987',
        carImage: 'images/car3.jpg',
        carName: 'Chevrolet Corvette C1'),
    CardDetails(startYear: '', endYear: '', carImage: '', carName: ''),
    CardDetails(startYear: '', endYear: '', carImage: '', carName: '')
  ];

  @override
  void initState() {
    super.initState();

    updateCardProvider = Provider.of<CardProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    int s = cardProvider.s;
    int s2 = cardProvider.s2;
    bool swipeRight = cardProvider.swipeRight;

    List<Widget> draggableCards = List<Widget>.generate(5, (i) {
      if (i == (5 - 1)) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: cardProvider.animationDuration,
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
              cardProvider.x,
              cardProvider.y,
              0,
              1,
            )..rotateZ((cardProvider.z)),
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                double position = details.globalPosition.dx;
                if (details.delta.dx > 0 &&
                    (s >= 3 || cardProvider.isChanged == true)) {
                  //ork on the s thing
                  // Swipe right direction.
                  swipingRight(position);
                } else if (details.delta.dx < 0 && s <= (data.length - 4)) {
                  //swipe left direction
                  swipingLeft(position);
                }
              },
              onHorizontalDragEnd: (details) {
                if (swipeRight == false && s <= (data.length - 4)) {
                  //swipe left end
                  swipeLeftEnd(details);
                } else if (swipeRight == true &&
                    (s >= 3 || cardProvider.isChanged == true)) {
                  //swipe right end
                  swipeRightEnd(details);
                }
              },
              child: Consumer<CardProvider>(
                  builder: (context, cardDetails, child) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0D0D0D),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 650.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.grey[600],
                          thickness: 3.7,
                          indent: 155.0,
                          endIndent: 155.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(carList[cardDetails.s].startYear,
                                style: TextStyle(
                                  color: Colors.grey[100],
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Oxygen',
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(' -' + carList[cardDetails.s].endYear,
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Oxygen',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.0
                                      ..color = Colors.grey,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.05),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                carList[cardDetails.s].carImage,
                              )),
                        ),
                        SizedBox(
                          height: 44.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text('1',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey[100])),
                                SizedBox(
                                  height: 8.0,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  radius: 1.8,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Text('2',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey[100])),
                              ],
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Text('3',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey[100])),
                              ],
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Text('4',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Oswald',
                                        color: Colors.grey[100])),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                        Text(carList[cardDetails.s].carName,
                            style: TextStyle(
                                fontSize: 52.0,
                                fontFamily: 'Cormorant Garamond',
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[100]))
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      } else {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: cardProvider.animationDuration,
            opacity: (i == 0) ? cardProvider.opacityValue : 0.05,
            child: AnimatedPadding(
              duration: cardProvider.animationDuration,
              padding: EdgeInsets.only(
                  left: (i == 0)
                      ? (cardProvider.leftPadding * (i + 1))
                      : (7.0 * (i + 1)),
                  right: (i == 0)
                      ? (cardProvider.leftPadding * (i + 1))
                      : (7.0 * (i + 1)),
                  bottom: (i == 0)
                      ? (cardProvider.bottomPadding * (i + 1))
                      : (10.0 * (i + 1))),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 650.0,
                  child: (i == 0 && s <= (data.length - 4))
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 10.0),
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.grey[600],
                                thickness: 3.7,
                                indent: 155.0,
                                endIndent: 155.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(carList[s2].startYear,
                                      style: TextStyle(
                                        color: Colors.grey[100],
                                        fontSize: 80.0,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 1.0,
                                        fontFamily: 'Oxygen',
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text(' -' + carList[s2].endYear,
                                        style: TextStyle(
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                          fontFamily: 'Oxygen',
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 1.0
                                            ..color = Colors.grey,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.05),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(carList[s2].carImage)),
                              ),
                              SizedBox(
                                height: 44.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text('1',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey[100])),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.grey[100],
                                        radius: 1.8,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    children: [
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey[100])),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    children: [
                                      Text('3',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey[100])),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    children: [
                                      Text('4',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Oswald',
                                              color: Colors.grey[100])),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 22.0,
                              ),
                              Text(carList[s2].carName,
                                  style: TextStyle(
                                      fontSize: 52.0,
                                      fontFamily: 'Cormorant Garamond',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[100]))
                            ],
                          ),
                        )
                      : null),
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
                    physics: const NeverScrollableScrollPhysics(),
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
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Oxygen',
                                      fontWeight: FontWeight.bold,
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

  void swipingRight(double position) {
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
    updateCardProvider.updateIsChanged(false);
    updateCardProvider.updateX(0);
    updateCardProvider.updateY(0);
    updateCardProvider.updateZ(0);
    updateCardProvider.updateOpacity(0);
    // updateCardProvider.updateS(updateCardProvider.s - 1);
    // updateCardProvider.updateS2(updateCardProvider.s2 - 1);

    _animateToIndex(updateCardProvider.s);
  }

  void swipeLeftEnd(DragEndDetails details) {
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

  void _animateToIndex(int index) {
    if (updateCardProvider.swipeRight == false) {
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
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }
}
