import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ui_animation_challenge1/widgets/cars_bottomsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double rights = 0.0;
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Stack(children: [
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
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                )
              ]),
            ),
            GestureDetector(
              onPanUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dx > 0) {}

                // Swiping in left direction.
                if (details.delta.dx < 0) {
                  rights = details.delta.dx;
                  print('swipe lwft');
                }
              },
              child: DraggableScrollableSheet(
                  initialChildSize: 0.65,
                  minChildSize: 0.65,
                  maxChildSize: 1.0,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        child: CarsBottomSheet(screenHeight: screenHeight));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
