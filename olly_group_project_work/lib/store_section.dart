import 'package:flutter/material.dart';

// A store section has a header, a grid to select from,
// and each grid to select from is associated with a defender or an object
// Colors is a placeholder
class StoreSection{
  String? sectionHeader;
  int? numberOfSquares;
  // Will have a list of character objects to display in defenders section
  // this also shows up in the upgrade dialog
  // for now just pngs
  List<MaterialColor>? colors;
  // Can make this a list of generic object type and have upgrades here
  List<Image>? objects;
  StoreSection({this.sectionHeader, this.numberOfSquares, this.colors, this.objects});
}