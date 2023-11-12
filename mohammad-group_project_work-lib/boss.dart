import 'dart:math';

import 'defender.dart';

// Base class for all enemies
class Enemy {
  String title;
  int baseHealth;
  int currentHealth;

  // Constructor
  Enemy({required this.title, required this.baseHealth})
      : currentHealth = baseHealth;

  // Method for basic attack
  void basicAttack(Defender target) {
    print('$title performs a basic attack on ${target.title}!');
    int damage = Random().nextInt(5) + 1; // Random damage between 1 and 5
    target.currentHealth -= damage;
    print('${target.title} takes $damage damage. ${target.title}\'s health: ${target.currentHealth}');
  }
}

// Boss class, inherits from Enemy
class Boss extends Enemy {
  // Constructor
  Boss({required String title, required int baseHealth})
      : super(title: title, baseHealth: baseHealth);

  // Short attack method
  void shortAttack(Defender target) {
    print('$title performs a short-range attack on ${target.title}!');
    int damage = Random().nextInt(10) + 1; // Random damage between 1 and 10
    target.currentHealth -= damage;
    print('${target.title} takes $damage damage. ${target.title}\'s health: ${target.currentHealth}');
  }

  // Long attack method
  void longAttack(Defender target) {
    print('$title performs a long-range attack on ${target.title}!');
    int damage = Random().nextInt(15) + 1; // Random damage between 1 and 15
    target.currentHealth -= damage;
    print('${target.title} takes $damage damage. ${target.title}\'s health: ${target.currentHealth}');
  }
}

void main() {
  // Example usage
  Defender player = Defender(title: "Player", baseHealth: 100);
  Boss evilBoss = Boss(title: "Evil Boss", baseHealth: 150);

  // Player and boss interactions
  player.miniAttack(evilBoss as Defender);
  evilBoss.basicAttack(player);
  evilBoss.shortAttack(player);
  player.megaAttack(evilBoss as Defender);
  evilBoss.longAttack(player);
}
