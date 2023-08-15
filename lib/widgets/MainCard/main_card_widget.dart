import 'package:flutter/material.dart';

import '../../AppServices/services.dart';
import '../../Models/card_details.dart';
import '../../Providers/card_providers.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    Key? key,
    required this.cardProvider,
    required this.s,
    required this.services,
    required this.carList,
    required this.swipeRight,
    required this.animationController,
    required this.stop1,
    required this.stop2,
    required this.height,
    required this.sizedBoxHeight,
    required this.textColor,
    required this.imageMatrix,
    required this.imageShadowOpacity,
    required this.sizedBoxHeight2,
    required this.height2,
  }) : super(key: key);

  final CardProvider cardProvider;
  final int s;
  final Services services;
  final List<CardDetails> carList;
  final bool swipeRight;
  final AnimationController animationController;
  final Animation<double> stop1;
  final Animation<double> stop2;
  final Animation<double> height;
  final Animation<double> sizedBoxHeight;
  final Animation<Color?> textColor;
  final Animation<Matrix4> imageMatrix;
  final Animation<double> imageShadowOpacity;
  final Animation<double> sizedBoxHeight2;
  final Animation<double> height2;

  @override
  Widget build(BuildContext context) {
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
                (s >= 3 || cardProvider.isChanged == true) &&
                cardProvider.swipeUp == false) {
              // Swipe right direction.
              services.swipingRight(position);
            } else if (details.delta.dx < 0 &&
                s <= (carList.length - 4) &&
                cardProvider.swipeUp == false) {
              //swipe left direction
              services.swipingLeft(position);
            }
          },
          onHorizontalDragEnd: (details) {
            if (swipeRight == false &&
                s <= (carList.length - 4) &&
                cardProvider.swipeUp == false) {
              //swipe left end
              services.swipeLeftEnd(details);
            } else if (swipeRight == true &&
                (s >= 3 || cardProvider.isChanged == true) &&
                cardProvider.swipeUp == false) {
              //swipe right end
              services.swipeRightEnd(details);
            }
          },
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < 0) {
              //Swipe Up Action
              services.dragUp(animationController);
            } else if (details.delta.dy > 0) {
              //Swipe Down Action
              services.dragDown(animationController);
            }
          },
          onVerticalDragEnd: (details) {
            if (cardProvider.swipeUp == true) {
              //Swipe Up End
              services.dragUpEnd();
            } else if (cardProvider.swipeUp == false) {
              //Swipe Down Event
              services.dragDownEnd();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[50]!, const Color(0xff0D0D0D)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [stop1.value, stop2.value],
                tileMode: TileMode.repeated,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            height: height.value,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: sizedBoxHeight.value,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 3.7,
                    indent: 155.0,
                    endIndent: 155.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(carList[s].startYear,
                          style: TextStyle(
                            color: textColor.value,
                            fontSize: 80.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            fontFamily: 'Oxygen',
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(' -' + carList[s].endYear,
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              fontFamily: 'Oxygen',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 0.5
                                ..color = textColor.value!,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Transform(
                    transform: imageMatrix.value,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(imageShadowOpacity.value),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child:
                              Image.asset(carList[s].carImage, height: 200.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight2.value,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text('1',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.normal,
                                  color: textColor.value)),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CircleAvatar(
                            backgroundColor: textColor.value,
                            radius: 1.8,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          Text('2',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.normal,
                                  color: textColor.value)),
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          Text('3',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.normal,
                                  color: textColor.value)),
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          Text('4',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Oswald',
                                  color: textColor.value)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Text(carList[s].carName,
                      style: TextStyle(
                          fontSize: 52.0,
                          fontFamily: 'Cormorant Garamond',
                          fontWeight: FontWeight.normal,
                          color: textColor.value)),
                ),
                Expanded(
                  child: Container(
                    transform: Matrix4.translationValues(0, height2.value, 0),
                    child: ListView(
                      padding: const EdgeInsets.only(left: 40.0),
                      shrinkWrap: true,
                      children: [
                        Divider(
                          color: Colors.grey[200],
                          thickness: 1.0,
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text('Production',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('1968-1982',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              width: 100.0,
                            ),
                            Column(
                              children: [
                                Text('Class',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('Sportcars',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(
                          color: Colors.grey[500],
                          thickness: 1.6,
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text('The third generation Corvette.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
