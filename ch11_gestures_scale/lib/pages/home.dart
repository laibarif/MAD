import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gestures'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _transformMatrix4(),
          _positionedStatusBar(context),
          _positionedInkWellAndInkResponse(context),
        ],
      ),
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
    );
  }

  Positioned _positionedInkWellAndInkResponse(BuildContext context) {
    return Positioned(
      top: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(
                  Icons.touch_app,
                  size: 32.0,
                ),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            ),
            InkResponse(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(
                  Icons.touch_app,
                  size: 32.0,
                ),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            ),
          ],
        ),
      ),
    );
  }

  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }

  void _setScaleBig() {
    setState(() {
      _currentScale = 16.0;
    });
  }

  void _onScaleStart(ScaleStartDetails details) {
    print('ScaleStartDetails: $details');
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print('ScaleUpdateDetails: $details - Scale: ${details.scale}');
    if (details.scale != 1.0) {
      double currentScale = _lastScale * details.scale;
      if (currentScale < 0.5) {
        currentScale = 0.5;
      }
      setState(() {
        _currentScale = currentScale;
      });
      print('_scale: $_currentScale - _lastScale: $_lastScale');
    } else if (details.scale == 1.0) {
      Offset offsetAdjustedForScale = (_startLastOffset - _lastOffset) / _lastScale;
      Offset currentOffset = details.focalPoint - (offsetAdjustedForScale * _currentScale);
      setState(() {
        _currentOffset = currentOffset;
      });
      print('offsetAdjustedForScale: $offsetAdjustedForScale - _currentOffset: $_currentOffset');
    }
  }

  void _onDoubleTap() {
    print('onDoubleTap');
    double currentScale = _lastScale * 2.0;
    if (currentScale > 16.0) {
      currentScale = 1.0;
      _resetToDefaultValues();
    }
    _lastScale = currentScale;
    setState(() {
      _currentScale = currentScale;
    });
  }

  void _onLongPress() {
    print('onLongPress');
    setState(() {
      _resetToDefaultValues();
    });
  }

  void _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }

  Widget _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image(
        image: AssetImage('assets/images/elephant.jpg'),
      ),
    );
  }

  Widget _positionedStatusBar(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Positioned(
      top: statusBarHeight,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.black54,
        height: 48.0,
        alignment: Alignment.center,
        child: Text(
          'Status Bar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}