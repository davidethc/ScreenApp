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
  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: colorThemes[2]);
  }
}

class LoginGradient {
  static const Color startColor = Color(0xFFE6D8FF);
  static const Color endColor = Color(0xFFB388FF);

  static LinearGradient get gradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [startColor, endColor],
    );
  }
}
