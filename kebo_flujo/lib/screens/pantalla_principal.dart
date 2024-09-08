import 'package:flutter/material.dart';
import 'package:kebo_flujo/config/theme/app_theme.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

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
              top: 250.23,
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
                    //boton aple

                    //boton googlw
                    Container()
                    // Aquí puedes agregar más texto o widgets si es necesario
                  ],
                ),
              ),
            ),
          ],
        ),

        //continual con email
        //no a miembro registrate ahora
      ),
    );
  }
}
