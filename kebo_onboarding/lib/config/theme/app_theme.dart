import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(255, 69, 70, 80);
const List<Color> colorThemes = [
  customColor,
  Colors.brown,
  Colors.yellow,
  Colors.pink,
  Colors.green,
  Colors.transparent,
  Colors.cyanAccent,
  // ... otros colores si los hay ...
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: colorThemes[2]);
  }
}
