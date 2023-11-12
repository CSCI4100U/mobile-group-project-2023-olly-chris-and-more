import 'dart:math';

class Defender {
  String title;
  int baseHealth;
  int currentHealth;
  int level;

  // Constructor
  Defender({required this.title, required this.baseHealth, this.level = 1})
      : currentHealth = baseHealth;

  // Mini attack method
  void miniAttack(Defender target) {
    print('$title performs a mini attack on ${target.title}!');

    int damage = Random().nextInt(5) + 1; // Random damage between 1 and 5
    target.currentHealth -= damage;

    print('${target.title} takes $damage damage. ${target.title}\'s health: ${target.currentHealth}');


  }

  // Mega attack method
  void megaAttack(Defender target) {
    print('$title performs a mega attack on ${target.title}!');

    // Implement mega attack logic here
    int damage = Random().nextInt(10) + 1; // Random damage between 1 and 10
    target.currentHealth -= damage;

    print('${target.title} takes $damage damage. ${target.title}\'s health: ${target.currentHealth}');

    // You can add more logic here based on your game requirements
  }


  void upgrade() {
    level++;
    baseHealth += 5; // Increase base health when upgraded
    currentHealth = baseHealth; // Reset current health to the new base health
    print('$title has been upgraded to level $level. Health increased to $baseHealth.');
  }
}

void main() {

  Defender chicken = Defender(title: "Chicken", baseHealth: 5);
  Defender sheep = Defender(title: "Sheep", baseHealth: 8);

  // Chicken performs attacks
  chicken.miniAttack(sheep);
  chicken.megaAttack(sheep);

  // Upgrade the chicken
  chicken.upgrade();

  // Chicken performs upgraded attacks
  chicken.miniAttack(sheep);
  chicken.megaAttack(sheep);
}
