import 'package:flutter/material.dart';

import '../AppServices/services.dart';
import '../Models/card_details.dart';
import '../Providers/card_providers.dart';

class DuplicateCard extends StatelessWidget {
  const DuplicateCard(
      {Key? key,
      required this.cardProvider,
      required this.s,
      required this.carList,
      required this.s2,
      required this.i})
      : super(key: key);

  final CardProvider cardProvider;
  final int s;
  final List<CardDetails> carList;
  final int s2;
  final int i;

  @override
  Widget build(BuildContext context) {
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
              height: 665.0,
              child: (i == 0 && s <= (carList.length - 4))
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 0.0),
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
                                child: Image.asset(
                                  carList[s2].carImage,
                                  height: 180.0,
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
}
