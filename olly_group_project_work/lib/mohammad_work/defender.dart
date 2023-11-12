import 'character.dart';

class Defender extends Character {
  Defender({
    required String skin,
    required String location,
    required int health,
  }) : super(skin: skin, location: location, health: health);

  Future<void> miniAttack(Character target) async {
    if (!isReloaded) {
      displaySnackbar("Warning: Not fully reloaded!");
      return;
    }

    // Perform mini attack logic
    target.health -= 20;

    isReloaded = false;
    displaySnackbar("Mini Attack successful! Reloading...");

    // Simulate reloading after a delay
    await Future.delayed(Duration(seconds: 2));
    isReloaded = true;
  }

  Future<void> megaAttack(Character target) async {
    if (!isReloaded) {
      displaySnackbar("Warning: Not fully reloaded!");
      return;
    }

    // Perform mega attack logic
    target.health -= 50;

    isReloaded = false;
    displaySnackbar("Mega Attack successful! Reloading...");

    // Simulate reloading after a delay
    await Future.delayed(Duration(seconds: 3));
    isReloaded = true;
  }
}

class FarmerWithShotgun extends Defender {
  FarmerWithShotgun({required String location})
      : super(skin: "Farmer", location: location, health: 100);
}

void main() async {
  var farmer = FarmerWithShotgun(location: "Farm");
  var chicken = Chicken(location: "Farm");
  var enemy = Enemy(location: "Forest");

  farmer.displayInfo();
  chicken.displayInfo();
  enemy.displayInfo();

  await farmer.miniAttack(enemy);

  farmer.displayInfo();
  enemy.displayInfo();

  await farmer.megaAttack(enemy);

  farmer.displayInfo();
  enemy.displayInfo();
}