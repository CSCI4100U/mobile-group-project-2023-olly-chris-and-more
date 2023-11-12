
import 'dart:async';

class Character {
  late String skin;
  late String location;
  late int health;
  late bool isReloaded;

  Character({
    required this.skin,
    required this.location,
    required this.health,
  }) : isReloaded = true;

  void displayInfo() {
    print("Skin: $skin, Location: $location, Health: $health");
  }

  Future<void> attack(Character target) async {
    if (!isReloaded) {
      displaySnackbar("Warning: Not fully reloaded!");
      return;
    }

    // Perform attack logic, e.g., decrease target's health
    target.health -= 10;

    isReloaded = false;
    displaySnackbar("Attack successful! Reloading...");

    // Simulate reloading after a delay
    await Future.delayed(Duration(seconds: 2));
    isReloaded = true;
  }

  void displaySnackbar(String message) {
    print("Snackbar: $message");
  }
}

class FarmerWithShotgun extends Character {
  FarmerWithShotgun({required String location})
      : super(skin: "Farmer", location: location, health: 100);
}

class Chicken extends Character {
  Chicken({required String location})
      : super(skin: "Chicken", location: location, health: 20);
}

class Sheep extends Character {
  Sheep({required String location})
      : super(skin: "Sheep", location: location, health: 30);
}

class Cow extends Character {
  Cow({required String location})
      : super(skin: "Cow", location: location, health: 50);
}

class Mortar extends Character {
  Mortar({required String location})
      : super(skin: "Mortar", location: location, health: 80);
}

class Enemy extends Character {
  Enemy({required String location})
      : super(skin: "Enemy", location: location, health: 50);
}

class Boss extends Character {
  Boss({required String location})
      : super(skin: "Boss", location: location, health: 200);
}
void main() async {
  var farmer = FarmerWithShotgun(location: "Farm");
  var chicken = Chicken(location: "Farm");
  var enemy = Enemy(location: "Forest");

  farmer.displayInfo();
  chicken.displayInfo();
  enemy.displayInfo();

  await farmer.attack(enemy);

  farmer.displayInfo();
  enemy.displayInfo();
}