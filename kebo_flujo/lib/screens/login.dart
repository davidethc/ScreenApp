import 'package:flutter/material.dart';
import 'package:kebo_flujo/components/my_button.dart';
import 'package:kebo_flujo/components/my_text_field.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    //SING IN METODO
    void signUserIn() {}

    return Scaffold(
      backgroundColor: colorThemes[0],
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
            SizedBox(
              height: 50,
            ),

            //welcome back,you've been missided
            Text(
              'welcome back you/ve been missided',
              style: TextStyle(
                  color: colorThemes[5],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            //username text field
            MyTextField(
              controller: userNameController,
              hinText: 'email',
              obscureText: false,
            ),

            SizedBox(
              height: 10,
            ),

            //password text field
            MyTextField(
              controller: passwordController,
              hinText: 'password',
              obscureText: true,
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            //sing in button
            MyButton(
              onTap: signUserIn,
            ),
            // or contunue with
            //google + aple sing buttons
            //not a member register now

            // ... resto de los widgets ...
          ]),
        ),
      ),
    );
  }
}
