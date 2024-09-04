import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kebo_flujo/screens/auth.dart';
import 'firebase_options.dart';

import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(keboApp());
}

class keboApp extends StatelessWidget {
  const keboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: AuthPage(),
    );
  }
}
