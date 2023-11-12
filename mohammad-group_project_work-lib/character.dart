import 'dart:math';

class Character {
  String name;
  String skin;
  String location;
  int health;
  int maxHealth;

  // Constructor
  Character({
    required this.name,
    required this.skin,
    required this.location,
    required this.health,
  }) : maxHealth = health;

  // Display information about the character
  void displayInfo() {
    print('$name\'s skin: $skin, location: $location, health: $health/$maxHealth');
  }

  // Attack method
  void attack(Character target) {
    if (isReadyToAttack()) {
      print('$name performs an attack on ${target.name}!');
      int damage = Random().nextInt(10) + 1; // Random damage between 1 and 10
      target.receiveDamage(damage);
      print('${target.name} takes $damage damage. ${target.name}\'s health: ${target.health}/${target.maxHealth}');
    } else {
      showWarningSnackbar();
    }
  }

  // Receive damage method
  void receiveDamage(int damage) {
    health -= damage;
    if (health < 0) {
      health = 0;
    }
  }

  // Check if the character is ready to attack
  bool isReadyToAttack() {
    // Example: Character is ready to attack if health is above a certain threshold
    return health > maxHealth * 0.2;
  }

  // Display a warning snackbar
  void showWarningSnackbar() {
    print('$name: Warning! Not fully reloaded. Ready to use next attack after reloading.');
    // Add logic for displaying a snackbar in a Flutter app
  }

  // Display a character description dialog
  void showCharacterDescriptionDialog() {
    print('Dialog: $name - $location\n$skin\nDescription: Add your character description here.');
    // Add logic for displaying a dialog in a Flutter app
  }
}

void main() {
  // Example usage
  Character chicken = Character(name: "Chicken", skin: "Feathers", location: "Farm", health: 20);
  Character sheep = Character(name: "Sheep", skin: "Wool", location: "Meadow", health: 25);
  Character cow = Character(name: "Cow", skin: "Hide", location: "Pasture", health: 30);
  Character mortar = Character(name: "Mortar", skin: "Metal", location: "Battlefield", health: 50);
  Character farmerWithShotgun = Character(name: "Farmer with Shotgun", skin: "Human", location: "Farm", health: 40);

  // Display character information
  chicken.displayInfo();
  sheep.displayInfo();
  cow.displayInfo();
  mortar.displayInfo();
  farmerWithShotgun.displayInfo();

  // Perform attacks
  chicken.attack(sheep);
  sheep.attack(cow);
  cow.attack(mortar);
  mortar.attack(farmerWithShotgun);
  farmerWithShotgun.attack(chicken);

  // Display character descriptions
  chicken.showCharacterDescriptionDialog();
  sheep.showCharacterDescriptionDialog();
  cow.showCharacterDescriptionDialog();
  mortar.showCharacterDescriptionDialog();
  farmerWithShotgun.showCharacterDescriptionDialog();
}
