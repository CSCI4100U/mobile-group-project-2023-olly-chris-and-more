import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:final_barnyard_defenders/barnyard_defenders_game.dart';
import 'package:final_barnyard_defenders/attack.dart';

// Combine editedDefender with this

// Need to get characters and animations
enum DefenderState{ idle }

// Extend this when have a lot of animations

// Could have character extends spriteanimation... and defender extends character?
class Defender extends SpriteAnimationGroupComponent
    with HasGameRef<BarnyardDefendersGame>{

  Image storeImage;
  String idleGameImage;
  String title;
  int health;
  Attack attack;
  int animationFrames;
  double idleTextureSizeWidth;
  double idleTextureSizeHeight;

  Defender({position, required this.storeImage, required this.idleGameImage,
    required this.title, required this.health, required this.attack,
    required this.animationFrames, required this.idleTextureSizeWidth,
    required this.idleTextureSizeHeight}) : super(position: position);

  // Animation just to see character on the screen
  late final SpriteAnimation idleAnimation;
  // Fps of animations stated in package
  final double stepTime = 0.05;

  // Shows defenders description in the store
  String description(){
    return "The $title has $health health and does ${attack!.damage} damage with a recharge time of ${attack!.rechargeTime}"
        "s covering a range of ${attack!.distance} units!";
  }

  void increaseHealth(int increase){
    health = health! + increase;
  }

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    // Getting images from cache
    // Chicken has 13 frames
    //idleAnimation = _spriteAnimation(idleGameImage!, 13);
    // Mushroom has 14 frames
    idleAnimation = _spriteAnimation(idleGameImage, animationFrames);

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
          textureSize: Vector2(idleTextureSizeWidth, idleTextureSizeHeight),
        )
    );
  }
}