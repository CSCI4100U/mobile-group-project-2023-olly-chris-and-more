import 'package:flutter/material.dart';
import 'attack.dart';

// Olly + Mohammad

// In game there are enemies and defenders, they are both characters

class Character{
  Image? skin;
  // Corrdinates may need to be different
  int? locationX;
  int? locationY;
  int? health;
  String? title;

  Character({this.skin, this.locationX, this.locationY, this.health, this.title});
}