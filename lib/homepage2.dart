import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_animation_challenge1/AppServices/services.dart';
import 'package:ui_animation_challenge1/Models/card_details.dart';
import 'package:ui_animation_challenge1/Providers/card_providers.dart';
import 'widgets/duplicate_card_widget.dart';
import 'widgets/MainCard/main_card_animation.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  late AnimationController _controller;

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
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    Services services = Services(context, scrollController);
    int s = cardProvider.s;
    int s2 = cardProvider.s2;
    bool swipeRight = cardProvider.swipeRight;

    List<Widget> draggableCards = List<Widget>.generate(5, (i) {
      if (i == (5 - 1)) {
        return MainCardAnimation(
            cardProvider: cardProvider,
            s: s,
            services: services,
            carList: carList,
            swipeRight: swipeRight,
            animationController: _controller);
      } else {
        return DuplicateCard(
            cardProvider: cardProvider, s: s, carList: carList, s2: s2, i: i);
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
                    itemCount: carList.length,
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
                              carList[index].startYear.toString(),
                              style: carList[s].startYear.toString ==
                                      carList[index].startYear.toString
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
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: cardProvider.back_arrow,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
