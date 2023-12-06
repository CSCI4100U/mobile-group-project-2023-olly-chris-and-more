// Character has a store image, idle animation,
// enemy doesn't have store image just defender, both have idle image
// and cooresponding function to load it

// enemies don't have an attack, characters do

import 'package:flame/components.dart';
import 'package:final_barnyard_defenders/barnyard_defenders_game.dart';

class Character extends SpriteAnimationGroupComponent
    with HasGameRef<BarnyardDefendersGame>{
  String animationImage;

  Character({required this.animationImage});
}