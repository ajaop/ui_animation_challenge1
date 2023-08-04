import 'package:flutter/material.dart';

class CarsBottomSheet extends StatefulWidget {
  const CarsBottomSheet({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  State<CarsBottomSheet> createState() => _CarsBottomSheetState();
}

class _CarsBottomSheetState extends State<CarsBottomSheet> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SizedBox(
        height: 1000.0,
      ),
    );
  }
}
