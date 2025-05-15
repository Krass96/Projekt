import 'package:artemi_project/src/features/artist_galery/galery.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Palette.artGold,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const Galery(),
    );
  }
}
