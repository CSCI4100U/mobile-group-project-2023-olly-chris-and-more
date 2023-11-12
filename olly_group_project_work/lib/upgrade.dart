import 'package:flutter/material.dart';
import 'editedDefender.dart';

// Can have associated defender, then apply upgrade to associated defender
// Also need associated thing to upgrade
class Upgrade{
  Text? title;
  int? value;
  Defender? defender;
  // This shouldn't be a value but string
  int? upgradeElement;

  // Maybe also have message to say upgrade applied

  Upgrade({this.title, this.value, this.defender, this.upgradeElement});

  void applyUpgrade(){
    // Want ie cow.health
    switch(upgradeElement){
      // applies to upgrade element 0
      case 0:
        defender!.increaseHealth(value!);
        // Test to see if applied
        print(defender!.description());
        break;
      case 1:
        defender!.attack!.increaseDamage(value!);
        break;
      case 2:
        defender!.attack!.decreaseRechargeTime(value!);
        break;
      case 3:
        defender!.attack!.increaseDamage(value!);
        break;
      case 4:
        defender!.attack!.increaseDistance(value!);
        break;
      case 5:
        defender!.attack!.decreaseRechargeTime(value!);
        break;
    }
  }

  // Cows health has increase by value
  String upgradeApplyMessage(){
    return "The ${defender!.title}'s ";
  }
}