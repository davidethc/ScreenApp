import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required void Function() onTap});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.gradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Image.asset(
                      'lib/images/logo.png', // Asegúrate de que esta ruta sea correcta
                      width: 100, // Ajusta el tamaño según necesites
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //welcome back,you've been missided
                  Text(
                    'La mejor aplicación para mejorar tu salud financiera',
                    style: TextStyle(
                        color: colorThemes[1],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//go

//goooooo
//go