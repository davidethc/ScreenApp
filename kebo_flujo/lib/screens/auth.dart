import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/screens/home_page.dart';

import 'package:kebo_flujo/screens/pantalla_principal.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // Usuario ha iniciado sesión
            return HomePage();
          } else {
            // Usuario no ha iniciado sesión
            return const PantallaPrincipal();
          }
          //usuario inicia sesion con email
        },
      ),
    );
  }
}
