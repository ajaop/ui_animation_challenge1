// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ui_animation_challenge1/Providers/card_providers.dart';
// import 'package:ui_animation_challenge1/widgets/cars_bottomsheet.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   List data = [1, 2, 3, 4, 5];
//   late AnimationController _animationController;
//   late Animation<double> leftRightPadding;
//   late Animation<double> bottomPadding;
//   late Animation<double> opacity;
//   bool isDismissed = false;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//         duration: const Duration(milliseconds: 1000), vsync: this);

//     leftRightPadding = Tween<double>(
//       begin: 7.0,
//       end: 0.0,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.ease,
//       ),
//     );

//     bottomPadding = Tween<double>(
//       begin: 20.0,
//       end: 0.0,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.ease,
//       ),
//     );

//     opacity = Tween<double>(
//       begin: 0.05,
//       end: 1.0,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.ease,
//       ),
//     );

//     opacity.addListener(() {
//       if (opacity.isCompleted) {
//         setState(() {
//           _animationController.reset();
//         });
//       }
//     });
//   }

//   Future<void> _swipeAnimation() async {
//     try {
//       await _animationController.forward().orCancel;
//     } on TickerCanceled {}
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   dismissItem(int index) {
//     setState(() {
//       data.removeAt(index);
//     });
//     Provider.of<CardProvider>(context, listen: false).updateOpacity(0.05);
//     Provider.of<CardProvider>(context, listen: false)
//         .updateLeftRightPadding(7.0);
//     Provider.of<CardProvider>(context, listen: false).updateBottomPadding(20.0);
//   }

//   addItem(int index) {
//     setState(() {
//       data.add(index);
//     });
//     Provider.of<CardProvider>(context, listen: false).updateOpacity(0.05);
//     Provider.of<CardProvider>(context, listen: false)
//         .updateLeftRightPadding(7.0);
//     Provider.of<CardProvider>(context, listen: false).updateBottomPadding(20.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var dataLength = data.length;
//     List<Widget> draggableCards = List<Widget>.generate(
//       data.length,
//       (i) {
//         if (i == dataLength - 1) {
//           return Listener(
//               child: Dismissible(
//                 key: UniqueKey(),
//                 //   direction: DismissDirection.endToStart,
//                 crossAxisEndOffset: -0.07,
//                 onUpdate: (DismissUpdateDetails details) {},
//                 onDismissed: (DismissDirection direction) {
//                   if (direction.name == 'endToStart') {
//                     dismissItem(i);
//                   } else {
//                     addItem(i + 1);
//                   }
//                 },
//                 child: DraggableScrollableSheet(
//                     initialChildSize: 0.65,
//                     minChildSize: 0.65,
//                     maxChildSize: 1.0,
//                     builder: (BuildContext context,
//                         ScrollController scrollController) {
//                       return SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           controller: scrollController,
//                           child: const CarsBottomSheet());
//                     }),
//               ),
//               onPointerUp: (PointerUpEvent ev) {
//                 if (ev.position.dx > 140 && ev.delta.dx < 1) {
//                   Provider.of<CardProvider>(context, listen: false)
//                       .updateOpacity(0.05);
//                 }
//               },
//               onPointerMove: (PointerMoveEvent move) {
//                 double position = move.position.dx;
//                 if (move.delta.dx < 1) {
//                   if (position > 300 && position < 341) {
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateOpacity(0.25);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateLeftRightPadding(5.25);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateBottomPadding(15.0);
//                   } else if (position > 200 && position < 300) {
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateOpacity(0.5);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateLeftRightPadding(3.5);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateBottomPadding(10.0);
//                   } else if (position > 100 && position < 200) {
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateOpacity(0.75);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateLeftRightPadding(1.75);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateBottomPadding(5.0);
//                   } else if (position < 100) {
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateOpacity(1.0);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateLeftRightPadding(0.0);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateBottomPadding(0.0);
//                   } else {
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateOpacity(0.05);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateLeftRightPadding(7.0);
//                     Provider.of<CardProvider>(context, listen: false)
//                         .updateBottomPadding(20.0);
//                   }
//                 }

//                 if (move.delta.dx > 1) {
//                   // if (position > 300 && position < 341) {
//                   //   Provider.of<CardProvider>(context, listen: false)
//                   //       .updateOpacity(1.0);
//                   // } else if (position > 200 && position < 300) {
//                   //   Provider.of<CardProvider>(context, listen: false)
//                   //       .updateDismissibleOpacity(0.75);
//                   // } else if (position > 100 && position < 200) {
//                   //   Provider.of<CardProvider>(context, listen: false)
//                   //       .updateDismissibleOpacity(0.5);
//                   // } else if (position < 100) {
//                   //   Provider.of<CardProvider>(context, listen: false)
//                   //       .updateDismissibleOpacity(0.25);
//                   // } else {
//                   //   Provider.of<CardProvider>(context, listen: false)
//                   //       .updateDismissibleOpacity(0.0);
//                   // }
//                 }
//               });
//         } else {
//           return Consumer<CardProvider>(builder: (context, card, child) {
//             return AnimatedOpacity(
//               duration: const Duration(milliseconds: 100),
//               opacity: (i != 0) ? 0.05 : card.opacityValue,
//               child: AnimatedPadding(
//                 duration: Duration(milliseconds: 100),
//                 padding: (i != 0)
//                     ? EdgeInsets.only(
//                         left: (7.0 * (i + 1)),
//                         right: (7.0 * (i + 1)),
//                         bottom: (20.0 * (i + 1)))
//                     : EdgeInsets.only(
//                         left: (card.leftRightPadding * (i + 1)),
//                         right: (card.leftRightPadding * (i + 1)),
//                         bottom: (card.bottomPadding * (i + 1))),
//                 child: DraggableScrollableSheet(
//                     initialChildSize: 0.65,
//                     minChildSize: 0.65,
//                     maxChildSize: 1.0,
//                     builder: (BuildContext context,
//                         ScrollController scrollController) {
//                       return SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           controller: scrollController,
//                           child: CarsBottomSheet());
//                     }),
//               ),
//             );
//           });
//         }
//       },
//     ).toList();

//     return MaterialApp(
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       // ),
//       home: Scaffold(
//         body: Stack(
//           children: [
//             SafeArea(
//               child: Stack(children: [
//                 const Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 30.0),
//                     child: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.black,
//                       size: 24.0,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Text('Timeline',
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           color: Colors.black,
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.bold)),
//                 )
//               ]),
//             ),
//             Stack(
//               children: draggableCards,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
