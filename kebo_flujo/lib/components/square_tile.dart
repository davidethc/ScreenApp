import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: colorThemes[1]),
          borderRadius: BorderRadius.circular(15),
          color: colorThemes[1]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          imagePath,
          height: 30,
        ),
      ),
    );
  }
}
