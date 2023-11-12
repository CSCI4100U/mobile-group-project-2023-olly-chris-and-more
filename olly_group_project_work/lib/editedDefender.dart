import 'package:flutter/material.dart';
import 'editedCharacter.dart';
import 'attack.dart';

class Defender extends Character{
  // Should character have 2 attacks?
  Attack? attack;

  Defender({Image? skin, int? locationX, int? locationY, int? health, String? title, this.attack})
      : super(skin: skin, locationX: locationX, locationY: locationY, health: health, title: title);

  // For the store
  // ie the cow does 5 points of damage
  String description(){
    return "The $title does ${attack!.damage} with a recharge time of ${attack!.rechargeTime}"
        "covering a range of ${attack!.distance} units!";
  }
}