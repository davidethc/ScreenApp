import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Image.asset(
              'lib/images/ic_logo.png', // Asegúrate de que esta ruta sea correcta
              width: 150, // Ajusta el tamaño según necesites
              height: 150,
            ),
          ),

          // ... resto de los widgets ...
        ],
      ),
    );
  }
}
