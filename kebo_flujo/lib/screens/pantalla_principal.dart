import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';
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
                            onPressed: () {},
                            icon: Icons.email,
                            text: 'Continuar con Email',
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          ),
                          SizedBox(height: 16),
                          //no miembro registrate ahora
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Not a member?'),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: Text(
                                  'Registrarse ahora',
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
    required VoidCallback
        onPressed, // Acción a realizar cuando se presiona el botón.
    IconData? icon, // Ícono que se mostrará en el botón (opcional).
    required String text, // Texto que se mostrará en el botón.
    required Color backgroundColor, // Color de fondo del botón.
    required Color textColor, // Color del texto del botón.
    String?
        imagePath, // Ruta de la imagen que se mostrará en lugar de un ícono (opcional).
  }) {
    return ElevatedButton(
      // Acción a realizar al presionar el botón.
      onPressed: onPressed,
      // Estilo del botón.
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize:
            const Size(double.infinity, 52), // Tamaño mínimo del botón.
        elevation: 0, // Sin sombra debajo del botón.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26), // Bordes redondeados.
        ),
      ),
      child: Row(
        // Organiza el contenido del botón en una fila.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Si se proporciona un ícono, lo muestra.
          if (icon != null)
            Icon(icon, color: textColor)
          // Si no hay ícono pero hay una imagen, muestra la imagen.
          else if (imagePath != null)
            Image.asset(imagePath, height: 24, width: 24),
          const SizedBox(width: 8), // Espacio entre el ícono/imagen y el texto.
          Text(
            text,
            style: TextStyle(color: textColor), // Estilo del texto.
          ),
        ],
      ),
    );
  }

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
}
