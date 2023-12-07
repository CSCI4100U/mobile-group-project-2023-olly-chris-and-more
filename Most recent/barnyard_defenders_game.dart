import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'dart:async';
import 'dart:ui';
import 'package:final_barnyard_defenders/levels/level.dart';
import 'package:final_barnyard_defenders/actors/defender.dart';

class BarnyardDefendersGame extends FlameGame{

  List<Defender>? defenders = [];

  BarnyardDefendersGame({this.defenders});

  @override
  Color backgroundColor() => const Color(0xFF000000);

  late final CameraComponent cam;
  // Pass in defenders selected in defenders list here?
  late final world = Level(defenders: defenders);

  @override
  FutureOr<void> onLoad() async {
    // Loads all images into cache
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