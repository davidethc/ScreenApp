import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/components/my_button.dart';
import 'package:kebo_flujo/components/my_text_field.dart';
import 'package:kebo_flujo/components/square_tile.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //text edit controller
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    // Añade este nuevo controlador
    final confirmPasswordController = TextEditingController();

    //SING uP METODO
    void signUserUp() async {
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

      try {
        //check if password is confirmed
        if (passwordController.text == confirmPasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userNameController.text,
            password: passwordController.text,
          );
        } else {
          showErrorMessage('Las contraseñas no coinciden');
        }
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
      backgroundColor: colorThemes[4],
      body: SafeArea(
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
              const SizedBox(
                height: 10,
              ),

              //welcome back,you've been missided
              Text(
                'welcome back you/ve been missided',
                style: TextStyle(
                    color: colorThemes[1],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              //username text field
              MyTextField(
                controller: userNameController,
                hinText: 'email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password text field
              MyTextField(
                controller: passwordController,
                hinText: 'contraseña',
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              //confirm password text field
              MyTextField(
                controller:
                    confirmPasswordController, // Usa el nuevo controlador aquí
                hinText: 'confirmar contraseña',
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: colorThemes[3].withOpacity(0.9)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //sing in button
              MyButton(
                onTap: signUserUp,
                text: 'Registrarse',
              ),

              const SizedBox(
                height: 10,
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
                      'or continue with',
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SquareTile(imagePath: 'lib/images/google.png')],
              ),
              const SizedBox(
                height: 20,
              ),

              //not a member register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now ',
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
    );
  }
}
