import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovingDot(),
    );
  }
}

class MovingDot extends StatefulWidget {
  @override
  _MovingDotState createState() => _MovingDotState();
}

class _MovingDotState extends State<MovingDot> with SingleTickerProviderStateMixin {
  double dotPositionX = -40.0; // Initial X position
  double dotPositionY = 0.0; // Initial Y position
  final double dotSize = 30.0;
  final double screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  final double screenHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  final double rightMove100 = 100.0;
  final double downMove100 = 100.0;
  final double rightMove200 = 200.0;
  final double downMove150 = 150.0;
  final double leftMove100 = 100.0;
  final double downMove200 = 200.0;
  bool isAnimating = false;
  bool wave1Start = false;

  @override
  void initState() {
    super.initState();
  }

  void startAnimation() {
    if (!isAnimating) {
      isAnimating = true;
      final Duration duration = Duration(seconds: 20);
      final controller = AnimationController(
        duration: duration,
        vsync: this,
      );
      controller.addListener(() {
        final progress = controller.value;

        if (progress < 0.1) {
          dotPositionX = progress * 10 * rightMove100;
          dotPositionY = 100.0;
        } else if (progress < 0.2) {
          dotPositionX = rightMove100;
          dotPositionY = 100.0 + (progress - 0.1) * 10 * downMove100;
        } else if (progress < 0.3) {
          dotPositionX = rightMove100 + (progress - 0.2) * 10 * rightMove200;
          dotPositionY = 100.0 + downMove100;
        } else if (progress < 0.4) {
          dotPositionX = rightMove100 + rightMove200;
          dotPositionY = 100.0 + downMove100 + (progress - 0.3) * 10 * downMove150;
        } else if (progress < 0.5) {
          dotPositionX = rightMove100 + rightMove200 - (progress - 0.4) * 10 * leftMove100;
          dotPositionY = 100.0 + downMove100 + downMove150;
        } else if (progress < 0.6) {
          dotPositionX = rightMove100 + rightMove200 - leftMove100;
          dotPositionY = 100.0 + downMove100 + downMove150 + (progress - 0.5) * 10 * downMove100;
        } else if (progress < 1.0) {
          dotPositionX = rightMove100 + rightMove200 - leftMove100 + (progress - 0.6) * 10 * rightMove200;
          dotPositionY = 100.0 + downMove100 + downMove150 + downMove100;
        }
        setState(() {});
        if (progress == 1.0) {
          isAnimating = false;
          wave1Start = false;
        }
      });
      controller.forward();
      wave1Start = true;

      Timer(Duration(seconds: 4), () {
        setState(() {
          wave1Start = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dot Version Pathing'),
      ),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: Colors.white,
          ),
          Positioned(
            left: dotPositionX,
            top: dotPositionY,
            child: Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
          if (!wave1Start)
            Positioned(
              top: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: startAnimation,
                child: Text('Wave Start'),
              ),
            ),
          if (wave1Start)
            Center(
              child: Text(
                'Wave 1 has Started',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
