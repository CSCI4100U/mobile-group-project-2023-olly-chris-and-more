import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'dart:async';
import 'dart:ui';
import 'package:final_barnyard_defenders/levels/level.dart';

class BarnyardDefendersGame extends FlameGame{

  @override
  Color backgroundColor() => const Color(0xFF000000);

  late final CameraComponent cam;
  final world = Level();

  @override
  FutureOr<void> onLoad() async {
    // Loads all images into cache, an app with lots of images can cause
    // issues
    await images.loadAllImages();
    // Level camera looks at, height and width of screen
    cam = CameraComponent.withFixedResolution(
        world: world,
        // For horizontal view
        width: 360,
        height: 640
    );

    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);

    return super.onLoad();
  }
}