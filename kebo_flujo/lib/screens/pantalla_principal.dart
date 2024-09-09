import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';
import 'package:kebo_flujo/screens/login_or_register.dart';
import 'package:kebo_flujo/services/auth_service.dart';

class PantallaPrincipal extends StatefulWidget {
  final VoidCallback? onTap;
  const PantallaPrincipal({super.key, this.onTap});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {
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
        //logo imagen
        child: Stack(
          children: [
            Positioned(
              top: 82.69,
              left: 38.5,
              child: Opacity(
                opacity: 1, // Nota: esto hará que la imagen sea invisible
                child: Container(
                  width: 130.36,
                  height: 58.4,
                  child: Image.asset(
                    'lib/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                  //texto de mejorar la salud financiera
                ),
              ),
            ),
            Positioned(
              top: 220.23,
              left: 40.77,
              child: Container(
                width: 273.18,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'La mejor aplicación\npara mejorar tu salud financiera',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 32,
                        fontWeight:
                            FontWeight.w500, // Aproximación más cercana a 510
                        height: 1.19375, // Equivalente a line-height: 38.19px
                        letterSpacing: 0.01 * 32, // 1% del tamaño de la fuente
                        color: Color(0xFF59297D), // Color del texto
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Maneja tus finanzas de forma fácil',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w400, // Aproximación más cercana a 510
                        height:
                            1.193125, // Equivalente a line-height: 19.09px (19.09 / 16)
                        letterSpacing: 0.01 * 16, // 1% del tamaño de la fuente
                        color: Color(0xFF000000), // Color negro
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),

                    //boton applw
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 55),
                          _buildSocialButton(
                            onPressed: () {},
                            icon: Icons.apple,
                            text: 'Continuar con Apple',
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 16),
                          _buildSocialButton(
                            onPressed: () => AuthService().signInWithGoogle(),
                            imagePath: 'lib/images/google.png',
                            text: 'Continuar con Google',
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          ),
                          SizedBox(height: 16),
                          //boton de email
                          _buildSocialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginOrRegister()),
                              );
                            },
                            icon: Icons.email,
                            text: 'Continuar con Email',
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          ),
                          SizedBox(height: 120),
                          //no miembro registrate ahora
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('No eres miembro?'),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: Text(
                                  'Regístrate ahora ',
                                  style: TextStyle(
                                      color: colorThemes[5],
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // Aquí puedes agregar más texto o widgets si es necesario
                  ],
                ),
              ),
            ),
          ],
        ),

        //no a miembro registrate ahora
      ),
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    IconData? icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    String? imagePath,
  }) {
    return Container(
      width: 312,
      height: 44,
      child: Opacity(
        opacity: 1, // Nota: esto hará que el botón sea invisible
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.fromLTRB(1, 1, 10, 1),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16), // Todas las esquinas redondeadas
              side: BorderSide(width: 1, color: Colors.transparent),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(icon, color: textColor)
              else if (imagePath != null)
                Image.asset(imagePath, height: 24, width: 24),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
