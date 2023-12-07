import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:final_barnyard_defenders/actors/defender.dart';
import 'package:flame/game.dart';

class Level extends World{
  List<Defender>? defenders;
  Level({this.defenders});

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    // Load level with 16 by 16 texture size, add to game component
    level = await TiledComponent.load('Level.tmx', Vector2.all(16));
    add(level);

    // Loading in barn
    final barnImage = await Flame.images.load("barn.png");
    final barn = SpriteComponent.fromImage(barnImage);

    // Part of giving player a location on the map
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    // Give each defender a spawnpoint lining up with point
    // from tiled file
    for (final spawnPoint in spawnPointsLayer!.objects){
      switch (spawnPoint.class_){
        case 'Defender0':
          defenders![0].position = Vector2(spawnPoint.x, spawnPoint.y);
          add(defenders![0]);
          break;
        case 'Defender1':
          defenders![1].position = Vector2(spawnPoint.x, spawnPoint.y);
          add(defenders![1]);
          break;
        case 'Defender2':
          defenders![2].position = Vector2(spawnPoint.x, spawnPoint.y);
          add(defenders![2]);
          break;
        case 'Barn':
          barn.position = Vector2(spawnPoint.x, spawnPoint.y);
          add(barn);
      }
    }
    return super.onLoad();
  }
}

