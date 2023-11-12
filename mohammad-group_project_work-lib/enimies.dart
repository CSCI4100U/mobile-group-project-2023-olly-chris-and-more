import 'dart:math';

// Base class for all characters
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

// Enemy class, inherits from Character
class Enemy extends Character {
  // Additional properties specific to enemies
  String enemyType;

  // Constructor
  Enemy({
    required String name,
    required String skin,
    required String location,
    required int health,
    required this.enemyType,
  }) : super(name: name, skin: skin, location: location, health: health);

  // Additional method specific to enemies
  void specialAbility() {
    print('$name uses a special ability as an $enemyType!');
    // Implement special ability logic here
  }
}

void main() {
  // Example usage
  Enemy zombie = Enemy(name: "Zombie", skin: "Decaying Flesh", location: "Graveyard", health: 30, enemyType: "Undead");
  Enemy orc = Enemy(name: "Orc", skin: "Green Scales", location: "Forest", health: 40, enemyType: "Orcish");

  // Display enemy information
  zombie.displayInfo();
  orc.displayInfo();

  // Perform attacks and use special abilities
  zombie.attack(orc);
  orc.attack(zombie);
  zombie.specialAbility();
  orc.specialAbility();
}
