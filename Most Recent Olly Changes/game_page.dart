import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'barnyard_defenders_game.dart';

// From main menu pass in the game which is created in main
class GamePage extends StatelessWidget {
  GamePage({Key? key, required this.game}) : super(key: key);

  BarnyardDefendersGame game;

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}

