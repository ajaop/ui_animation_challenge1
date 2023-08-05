import 'dart:math';

import 'package:flutter/material.dart';

class CarsBottomSheet extends StatefulWidget {
  const CarsBottomSheet({Key? key}) : super(key: key);

  @override
  State<CarsBottomSheet> createState() => _CarsBottomSheetState();
}

class _CarsBottomSheetState extends State<CarsBottomSheet> {
  //List<Widget> cards = List.generate(20, (i) => const CustomCard()).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: const SizedBox(
        height: 1000.0,
      ),
    );
  }
}
