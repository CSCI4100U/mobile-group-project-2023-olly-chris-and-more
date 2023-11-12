import 'character.dart';

class Enemy extends Character {
  late String path;

  Enemy({
    required String skin,
    required String location,
    required int health,
    required this.path,
  }) : super(skin: skin, location: location, health: health);

  Future<void> rangeAttack(Character target) async {
    if (!isReloaded) {
      displaySnackbar("Warning: Not fully reloaded!");
      return;
    }

    // Perform range attack logic
    target.health -= 30;

    isReloaded = false;
    displaySnackbar("Range Attack successful! Reloading...");

    // Simulate reloading after a delay
    await Future.delayed(Duration(seconds: 2));
    isReloaded = true;
  }
}

class ShortRangeEnemy extends Enemy {
  ShortRangeEnemy({required String location, required String path})
      : super(skin: "Short Range Enemy", location: location, health: 50, path: path);
}

class LongRangeEnemy extends Enemy {
  LongRangeEnemy({required String location, required String path})
      : super(skin: "Long Range Enemy", location: location, health: 40, path: path);
}
void main() async {
  var shortRangeEnemy = ShortRangeEnemy(location: "Forest", path: "Left");
  var longRangeEnemy = LongRangeEnemy(location: "Mountain", path: "Right");
  var defender = FarmerWithShotgun(location: "Farm");

  shortRangeEnemy.displayInfo();
  longRangeEnemy.displayInfo();
  defender.displayInfo();

  await shortRangeEnemy.rangeAttack(defender);

  shortRangeEnemy.displayInfo();
  defender.displayInfo();

  await longRangeEnemy.rangeAttack(defender);

  longRangeEnemy.displayInfo();
  defender.displayInfo();
}
