import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(255, 69, 70, 80);
const List<Color> colorThemes = [
  Color.fromARGB(210, 248, 243, 243),
  Colors.white,
  Color.fromARGB(91, 158, 158, 158),
  Colors.black,
  Colors.green,
  Colors.cyanAccent,
  // ... otros colores si los hay ...
];

class AppTheme {
  static ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: colorThemes[2]);
  }

  static LinearGradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE6D8FF),
      Color(0xFFB388FF),
    ],
  );
}
