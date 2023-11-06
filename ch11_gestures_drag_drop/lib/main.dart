import 'package:flutter/material.dart';
import 'package:ch11_gestures_drag_drop/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
    );
  }
}
