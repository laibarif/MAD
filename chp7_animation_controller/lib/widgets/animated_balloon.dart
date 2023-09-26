import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBalloonWidget> createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  AnimationController? _controllerFloatUp;
  AnimationController? _controllerGrowSize;
  Animation<double>? _animationFloatUp;
  Animation<double>? _animationGrowSize;

  // Declare _balloonWidth and _balloonBottomLocation as instance variables
  double _balloonWidth = 0.0;
  double _balloonBottomLocation = 0.0;
  double _balloonHeight = 0.0; // Declare _balloonHeight

  @override
  void initState() {
    super.initState();

    _controllerFloatUp = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _controllerGrowSize = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _balloonHeight = MediaQuery.of(context).size.height / 2; // Calculate _balloonHeight
    _balloonBottomLocation = MediaQuery.of(context).size.height - _balloonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controllerFloatUp!,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controllerGrowSize!,
        curve: Curves.elasticInOut,
      ),
    );

    // Start the animations
    _controllerFloatUp!.forward();
    _controllerGrowSize!.forward();
  }

  @override
  void dispose() {
    _controllerFloatUp!.dispose();
    _controllerGrowSize!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate balloon dimensions and position here

    return AnimatedBuilder(
      animation: _animationFloatUp!,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp!.value,
          ),
          width: _animationGrowSize!.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp!.isCompleted) {
            _controllerFloatUp!.reverse();
            _controllerGrowSize!.reverse();
          } else {
            _controllerFloatUp!.forward();
            _controllerGrowSize!.forward();
          }
        },
        child: Image.asset(
          'assets/images/download.png', // Replace with your image path
          height: _balloonHeight,
          width: _balloonWidth,
        ),
      ),
    );
  }
}
