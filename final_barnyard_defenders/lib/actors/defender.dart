import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:final_barnyard_defenders/barnyard_defenders_game.dart';

// Combine editedDefender with this

// Need to get characters and animations
enum DefenderState{ idle }

// Extend this when have a lot of animations

// Could have character extends spriteanimation... and defender extends character?
class Defender extends SpriteAnimationGroupComponent
    with HasGameRef<BarnyardDefendersGame>{

  //String? title;
  // can have idle game image, and store image
  //Image? storeImage;
  String? idleGameImage;

  Defender({position, required this.idleGameImage}) : super(position: position);

  // Animation just to see character on the screen
  late final SpriteAnimation idleAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    // Getting images from cache
    idleAnimation = _spriteAnimation(idleGameImage!, 13);

    // List of all animations
    animations = {
      DefenderState.idle: idleAnimation,
    };

    // Set current animation
    current = DefenderState.idle;
  }

  // This function might be unique to defenders cuz gets wierd with moving enemies
  SpriteAnimation _spriteAnimation(String gameImage, int amount){
    print("Attempting load: $gameImage");
    return SpriteAnimation.fromFrameData(
        game.images.fromCache(gameImage),
        SpriteAnimationData.sequenced(
          // Amount of images in animation
          amount: amount,
          // Same as 20 fps - stuff downloaded will say what this should be
          stepTime: stepTime,
          textureSize: Vector2(32,34),
        )
    );
  }
}