import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function() onTap;
  const SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
