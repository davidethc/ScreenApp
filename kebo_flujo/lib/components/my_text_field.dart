import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hinText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      this.controller,
      required this.hinText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorThemes[1])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorThemes[2])),
            fillColor: colorThemes[1].withOpacity(0.5),
            filled: true,
            hintText: hinText,
            hintStyle: TextStyle(color: colorThemes[3].withOpacity(0.3))),
      ),
    );
  }
}
