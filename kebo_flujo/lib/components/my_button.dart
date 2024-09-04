import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: colorThemes[3], borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            'Sign In :)',
            style: TextStyle(color: colorThemes[1], fontSize: 20),
          ),
        ),
      ),
    );
  }
}
