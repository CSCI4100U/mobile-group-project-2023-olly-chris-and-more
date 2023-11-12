import 'character.dart';
import 'character.dart';
import 'enemies.dart';

class Boss extends enemies {
  Boss({required String location, required String path})
      : super(skin: "Boss", location: location, health: 200, path: path);

  Future<void> shortAttack(Character target) async {
    ShortRangeEnemy({required String location, required String path}, location: '', path: '')
    : super(skin: "Short Range Enemy", location: location, health: 50, path: path);
  }

  Future<void> longAttack(Character target) async {
    // Implement long-range attack logic for the boss
    // ...
  }
}

class enemies {
}

class Round {
  List<Defender> defenders;
  List<Enemy> enemies;
  int length;

  Round({
    required this.defenders,
    required this.enemies,
    required this.length,
  });
}

class Game {
  List<Round> rounds;
  String season;
  int timeToUsePickers;

  Game({
    required this.rounds,
    required this.season,
    required this.timeToUsePickers,
  });
}

void main() async {
  // Example usage of the classes
  var shortRangeEnemy = ShortRangeEnemy(location: "Forest", path: "Left");
  var longRangeEnemy = LongRangeEnemy(location: "Mountain", path: "Right");
  var bossEnemy = Boss(location: "Cave", path: "Center");

  var farmer = FarmerWithShotgun(location: "Farm");
  var chicken = Chicken(location: "Farm");
  var mortar = Mortar(location: "Hill");

  var defenders = [farmer, chicken, mortar];
  var enemies = [shortRangeEnemy, longRangeEnemy, bossEnemy];

  var round1 = Round(defenders: defenders, enemies: [shortRangeEnemy], length: 60);
  var round2 = Round(defenders: defenders, enemies: [longRangeEnemy, shortRangeEnemy], length: 90);
  var round3 = Round(defenders: defenders, enemies: [bossEnemy], length: 120);

  var game = Game(rounds: [round1, round2, round3], season: "Winter", timeToUsePickers: 180);

  for (var round in game.rounds) {
    print("Starting Round!");

    // Logic for each round
    for (var enemy in round.enemies) {
      print("Enemy approaching from ${enemy.path}");

      // Interaction between defenders and enemies
      for (var defender in round.defenders) {
        await defender.miniAttack(enemy);
      }
    }

    // Additional round-specific logic

    print("Round Complete!");
  }

  print("Game Over! Season: ${game.season}");
}