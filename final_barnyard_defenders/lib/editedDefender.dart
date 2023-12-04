import 'package:flutter/material.dart';
import 'editedCharacter.dart';
import 'attack.dart';

// Olly + Mohammad

// Defenders are good guy characters which defend the barn
// barn not implemented yet

class Defender extends Character{
  // Should character have 2 attacks?
  Attack? attack;

  Defender({Image? skin, int? locationX, int? locationY, int? health, String? title, this.attack})
      : super(skin: skin, locationX: locationX, locationY: locationY, health: health, title: title);

  // Shows defenders description in the store
  String description(){
    return "The $title has $health health and does ${attack!.damage} damage with a recharge time of ${attack!.rechargeTime}"
        "s covering a range of ${attack!.distance} units!";
  }

  void increaseHealth(int increase){
    health = health! + increase;
  }
}