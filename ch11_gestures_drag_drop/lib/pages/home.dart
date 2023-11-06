import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _gestureDetected = '';
  Color _paintedColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures & Drag Drop'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              _buildDragTarget(),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text(
            'Drag Me below to change color',
          ),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> rejectedData) =>
      acceptedData.isEmpty
          ? Text(
        'Drag To and see color change',
        style: TextStyle(color: _paintedColor),
      )
          : Text(
        'Painting Color: $acceptedData',
        style: TextStyle(
          color: Color(acceptedData[0]),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}