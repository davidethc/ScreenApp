import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/components/my_button.dart';
import 'package:kebo_flujo/components/my_text_field.dart';
import 'package:kebo_flujo/components/square_tile.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';
import 'package:kebo_flujo/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //text edit controller
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    //SING IN METODO
    void signUserIn() async {
      // mostrar círculo de carga
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      // mensaje de error para el usuario
      void showErrorMessage(String message) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.deepPurple,
              title: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        );
      }

      //try creating the user
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text,
        );
        // cerrar el círculo de carga
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // cerrar el círculo de carga
        Navigator.pop(context);
        // mostrar mensaje de error
        showErrorMessage(e.code);
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.gradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                // Logo
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Image.asset(
                    'lib/images/ic_logo.png', // Asegúrate de que esta ruta sea correcta
                    width: 100, // Ajusta el tamaño según necesites
                    height: 100,
                  ),
                ),

                //welcome back,you've been missided
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: colorThemes[3].withOpacity(0.8),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //username text field
                MyTextField(
                  controller: userNameController,
                  hinText: 'Correo electronico',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                //password text field
                MyTextField(
                  controller: passwordController,
                  hinText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style:
                            TextStyle(color: colorThemes[3].withOpacity(0.9)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //sing in button
                MyButton(
                  text: 'Iniciar Sesión',
                  onTap: signUserIn,
                ),

                const SizedBox(
                  height: 50,
                ),

                // or contunue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: colorThemes[1],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Text(
                        'o continuar con',
                        style: TextStyle(color: colorThemes[3]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: colorThemes[1],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                //google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/images/google.png',
                      onTap: () => AuthService().signInWithGoogle(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                /////

                //////
                ///

                //not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No tienes una cuenta?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Registrate ahora',
                        style: TextStyle(
                            color: colorThemes[5], fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
                // ... resto de los widgets ...
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
