import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'barnyard_defenders_game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isFirstClick = true;

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
            Positioned(
              top: 100,
              left: 1,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
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
}
