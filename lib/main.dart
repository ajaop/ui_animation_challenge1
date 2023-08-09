import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_animation_challenge1/Providers/card_providers.dart';
import 'package:ui_animation_challenge1/homepage2.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(
          create: (context) => CardProvider(),
        )
      ],
      child: MaterialApp(
          initialRoute: '/', routes: {'/': (context) => HomePage2()}),
    );
  }
}
