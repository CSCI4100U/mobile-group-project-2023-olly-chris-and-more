import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World{
  // final String levelName;
  //
  // Level({required this.levelName});

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    // Load level with 16 by 16 texture size
    level = await TiledComponent.load('Level.tmx', Vector2.all(16));
    // adding level to game component
    add(level);

    // Part of giving player a location on the map
    // final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');
    //
    // for (final spawnPoint in spawnPointsLayer!.objects){
    //   switch (spawnPoint.class_){
    //   // When the class in spawnpoint is player, create player
    //     case 'Player':
    //       final player = Player(
    //           character: 'Mask Dude',
    //           position: Vector2(spawnPoint.x, spawnPoint.y)
    //       );
    //       add(player);
    //       break;
    //     default:
    //   }
    // }

    // add player to the level
    //add(Player(character: 'Ninja Frog'));
    return super.onLoad();
  }
}

