import 'package:flutter/material.dart';
import 'package:chp8_drwaer/pages/birthdays.dart';
import 'package:chp8_drwaer/pages/gratitude.dart';
import 'package:chp8_drwaer/pages/reminders.dart';
import 'package:chp8_drwaer/widgets/left_drawer.dart';
import 'package:chp8_drwaer/widgets/right_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      drawer: LeftDrawerWidget(),
      endDrawer: RightDrawerWidget(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
