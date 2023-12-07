import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'barnyard_defenders_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of BarnyardDefendersGame
    BarnyardDefendersGame game = BarnyardDefendersGame();

    return Scaffold(
      appBar: AppBar(
        title: Text("Barnyard Defenders"),
      ),
      body: Stack(
        children: [
          GameWidget(game: game),
          // Wave Start button
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Call the startWave method when the button is pressed
                game.startWave();
              },
              child: Text("Wave Start"),
            ),
          ),
        ],
      ),
    );
  }
}
