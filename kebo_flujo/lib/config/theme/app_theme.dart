import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(255, 69, 70, 80);
const List<Color> colorThemes = [
  Color.fromARGB(210, 248, 243, 243),
  Colors.white,
  Color.fromARGB(91, 158, 158, 158),
  Colors.black,
  Colors.green,
  Colors.white,
  Colors.cyanAccent,
  // ... otros colores si los hay ...
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: colorThemes[2]);
  }
}
