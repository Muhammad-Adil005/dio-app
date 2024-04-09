import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

void main() {
  runApp(const DioApp());
}

class DioApp extends StatelessWidget {
  const DioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), //HomeScreen(),
    );
  }
}
