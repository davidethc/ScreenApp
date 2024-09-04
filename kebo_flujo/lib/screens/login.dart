import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/components/my_button.dart';
import 'package:kebo_flujo/components/my_text_field.dart';
import 'package:kebo_flujo/components/square_tile.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //text edit controller
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    //SING IN METODO
    void signUserIn() async {
      //show loading circle
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      //try sign in
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else {
          print('Error: ${e.message}');
        }
      } catch (e) {
        print('An unexpected error occurred: $e');
      }

      //remove loading circle
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: colorThemes[4],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            // Logo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Image.asset(
                'lib/images/ic_logo.png', // Asegúrate de que esta ruta sea correcta
                width: 100, // Ajusta el tamaño según necesites
                height: 100,
              ),
            ),
            const SizedBox(
              height: 50,
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
              hinText: 'password',
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

            /////

            //////
            ///

            //not a member register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member?'),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Register now ',
                  style: TextStyle(
                      color: colorThemes[5], fontWeight: FontWeight.bold),
                )
              ],
            )
            // ... resto de los widgets ...
          ]),
        ),
      ),
    );
  }
}
