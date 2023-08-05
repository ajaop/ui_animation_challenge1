import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_animation_challenge1/Providers/card_providers.dart';
import 'package:ui_animation_challenge1/widgets/cars_bottomsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> leftRightPadding;
  late Animation<double> bottomPadding;
  late Animation<double> opacity;
  List data = [1, 2, 3, 4, 5];
  int flag = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    leftRightPadding = Tween<double>(
      begin: 7.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    bottomPadding = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    opacity = Tween<double>(
      begin: 0.05,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    opacity.addListener(() {
      if (opacity.isCompleted) {
        setState(() {
          _animationController.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _swipeAnimation() async {
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {}
  }

  dismissImg(int index) {
    _swipeAnimation();
    setState(() {
      data.removeAt(index);
    });
  }

  addImg(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var dataLength = data.length;
    List<Widget> draggableCards = List<Widget>.generate(
      data.length,
      (i) {
        if (i == dataLength - 1) {
          return Dismissible(
            key: UniqueKey(),
            crossAxisEndOffset: -0.07,
            onUpdate: (DismissUpdateDetails details) {},
            onDismissed: (DismissDirection direction) {
              dismissImg(i);
            },
            child: DraggableScrollableSheet(
                initialChildSize: 0.65,
                minChildSize: 0.65,
                maxChildSize: 1.0,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      child: const CarsBottomSheet());
                }),
          );
        } else {
          return Opacity(
            opacity: opacity.value,
            child: Padding(
              padding: EdgeInsets.only(
                  left: (leftRightPadding.value * (i + 1)),
                  right: (leftRightPadding.value * (i + 1)),
                  bottom: (bottomPadding.value * (i + 1))),
              child: DraggableScrollableSheet(
                  initialChildSize: 0.65,
                  minChildSize: 0.65,
                  maxChildSize: 1.0,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        child: CarsBottomSheet());
                  }),
            ),
          );
        }
      },
    ).toList();

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
            Stack(
              children: draggableCards,
            )
          ],
        ),
      ),
    );
  }
}
