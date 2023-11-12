import 'package:flutter/material.dart';
import 'attack.dart';

// Changed: doesn't have attack but defenders which inherit this do
class Character{
  Image? skin;
  // Corrdinates may need to be different
  int? locationX;
  int? locationY;
  int? health;
  String? title;

  Character({this.skin, this.locationX, this.locationY, this.health, this.title});
}