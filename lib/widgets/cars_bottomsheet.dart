import 'dart:math';

import 'package:flutter/material.dart';

class CarsBottomSheet extends StatefulWidget {
  const CarsBottomSheet({Key? key}) : super(key: key);

  @override
  State<CarsBottomSheet> createState() => _CarsBottomSheetState();
}

class _CarsBottomSheetState extends State<CarsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
