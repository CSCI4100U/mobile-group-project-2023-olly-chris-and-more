import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'barnyard_defenders_game.dart';

// From main menu pass in the game which is created in main
// class GamePage extends StatelessWidget {
//   GamePage({Key? key, required this.game}) : super(key: key);
//
//   BarnyardDefendersGame game;
//
//   @override
//   Widget build(BuildContext context) {
//     return GameWidget(game: game);
//   }
// }

class GamePage extends StatelessWidget {
  //const GamePage({Key? key});
  BarnyardDefendersGame game;
  GamePage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an instance of BarnyardDefendersGame
    // BarnyardDefendersGame game = BarnyardDefendersGame();

    return Scaffold(
      appBar: AppBar(
        title: Text("Barnyard Defenders"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), // You can change the icon as needed
            onPressed: () {
              // super.onDetach();
              // Add the logic to exit the game here
              // For example, navigate back to the previous screen or perform exit actions
              // Navigator.pop(context); // Example: Popping the current screen
            },
          ),
        ],
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
                //game.startWave();
              },
              // Will take out waves
              child: Text("Wave Start"),
            ),
          ),
        ],
      ),
    );
  }
}

