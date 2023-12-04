import 'dart:async';

import 'package:flame/components.dart';
import 'package:final_barnyard_defenders/barnyard_defenders_game.dart';

// Combine editedDefender with this

// Need to get characters and animations
enum DefenderState{ idle, running }

// Extend this when have a lot of animations
class Defender extends SpriteAnimationGroupComponent
    with HasGameRef<BarnyardDefendersGame>{

  String character;

  Defender({position, required this.character}) : super(position: position);


  // Animation just to see character on the screen
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;

  // @override
  // FutureOr<void> onLoad() {
  //   _loadAllAnimations();
  //   return super.onLoad();
  // }

  // void _loadAllAnimations() {
  //   // Getting images from cache
  //   // For project if the object has an image like below, can do character.picture
  //   // where that is storing the image path
  //   idleAnimation = _spriteAnimation('Idle', 11);
  //   runningAnimation = _spriteAnimation('Run', 12);
  //
  //   // List of all animations
  //   animations = {
  //     PlayerState.idle: idleAnimation,
  //     PlayerState.running: runningAnimation
  //   };
  //
  //   // Set current animation
  //   current = PlayerState.idle;
  //   //current = PlayerState.running;
  //
  // }

  SpriteAnimation _spriteAnimation(String state, int amount){
    return SpriteAnimation.fromFrameData(
        game.images.fromCache('Main Characters/$character/$state (32x32).png'),
        SpriteAnimationData.sequenced(
          // Amount of images in animation
          amount: amount,
          // Same as 20 fps - stuff downloaded will say what this should be
          stepTime: stepTime,
          textureSize: Vector2.all(32),
        )
    );
  }
}