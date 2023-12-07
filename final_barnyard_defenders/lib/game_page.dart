import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'barnyard_defenders_game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFirstClick = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 16), // Total duration for the entire movement
    );
  }

  @override
  Widget build(BuildContext context) {
    BarnyardDefendersGame game = BarnyardDefendersGame();

    return Scaffold(
      appBar: AppBar(
        title: Text("Barnyard Defenders"),
      ),
      body: Stack(
        children: [
          GameWidget(game: game),
          if (!isFirstClick)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double leftPosition;
                double topPosition;
                double segmentDuration = 4.0; // Each segment duration

                if (_controller.value < 0.25) {
                  // Move right 150 
                  leftPosition = 1 + _controller.value * 600;
                  topPosition = 100;
                } else if (_controller.value < 0.5) {
                  // Move down 200
                  leftPosition = 151;
                  topPosition = 100 + (_controller.value - 0.25) * 800;
                } else if (_controller.value < 0.75) {
                  // Move right 100 
                  leftPosition = 151 + (_controller.value - 0.5) * 430;
                  topPosition = 300;
                } else {
                  // Move down 400 
                  leftPosition = 281;
                  topPosition = 300 + (_controller.value - 0.75) * 1600;
                }

                return Positioned(
                  left: leftPosition,
                  top: topPosition,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          // Wave Start button
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                game.startWave();
                if (isFirstClick) {
                  setState(() {
                    isFirstClick = false;
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      _controller.forward(); // Animation
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        content: Text(
                          "The Game has Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: Text("Wave Start"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
