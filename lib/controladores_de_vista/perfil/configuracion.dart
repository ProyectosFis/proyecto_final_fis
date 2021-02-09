import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final_fis/controladores_de_vista/home.dart';
import 'package:proyecto_final_fis/componentes/fade_route.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:proyecto_final_fis/componentes/catapultaScrollView.dart';
class Configuracion extends StatefulWidget {
  @override
  _ConfiguracionState createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {

  nextRoute()  {

    Navigator.push(
      context,
      FadeRoute(
          page:  PaginaPrincipal()

      ),
    );
  }
  principalRoute()  {

    cerrarSesion();
  }

  void cerrarSesion() {
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/screen4', (Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 1,
        title: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Configuración',
                  style: kTituloRegistrarUsuario,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 15,
                      child: GestureDetector(
                          onTap: (){
                            nextRoute();
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'imagenes/volver.png'
                            ),
                          )
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),

      ),
      body: CatapultaScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 375,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 26,
                          ),
                          GestureDetector(
                            onTap: (){
                              principalRoute();

                            },
                            child: Text(
                              'Cerrar Sesión',
                              style: GoogleFonts.poppins(
                                textStyle: kLabelCerrarSesion
                              ),
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 1,
                      color: kBlackColor.withOpacity(0.1),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
