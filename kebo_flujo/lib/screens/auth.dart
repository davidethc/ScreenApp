import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/screens/home_page.dart';
import 'package:kebo_flujo/screens/login.dart';
import 'package:kebo_flujo/screens/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginOrRegister();
          }
          //user is not logged in
        },
      ),
    );
  }
}
