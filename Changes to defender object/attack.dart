import 'package:flutter/material.dart';
import 'dart:math';

// Created by Olly

class Attack{
  int? damage;
  // Attacks take certain amount of time to be used
  int? rechargeTime;
  // If distance is 10 enemy must be 10 values away for it to work, x or y,
  // So distance is like a square shape of 10 everywhere where the attack can
  // take effect
  int? distance;
  Attack({this.damage, this.rechargeTime, this.distance});

  void increaseDamage(int increase){
    damage = damage! + increase;
  }
  void decreaseRechargeTime(int increase){
    rechargeTime = rechargeTime! + increase;
  }
  void increaseDistance(int increase){
    distance = distance! + increase;
  }

  // Wanna pass in enemy location and defender, if difference is greater then distance
  // then no attack done, return true if distance close and therefore attack valid
  bool checkProximity(int enemyLocX, int enemyLocY, int defenderLocX, int defenderLocY){
    if ((enemyLocX - defenderLocX).abs() == distance || (enemyLocY - defenderLocY).abs() == distance){
      return true;
    }
    else{
      return false;
    }
  }
  // In enemy class should check first if an attack is valid by calling check proximity
  // before committing an attack, should be doing so continously in a loop?

  // Need to somehow make sure what there attacking is an enemy
  // add pickers to home screen

}