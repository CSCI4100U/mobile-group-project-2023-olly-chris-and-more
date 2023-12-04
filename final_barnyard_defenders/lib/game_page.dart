import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'barnyard_defenders_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    BarnyardDefendersGame game = BarnyardDefendersGame();
    return GameWidget(game: game);
  }
}

