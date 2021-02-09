import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_fis/controladores_de_vista/home.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final_fis/componentes/catapultaScrollView.dart';
import 'package:proyecto_final_fis/componentes/fade_route.dart';
import 'package:proyecto_final_fis/componentes/container_iniciar_sesion.dart';
import 'package:proyecto_final_fis/componentes/container_registrar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class IniciarSesion extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => IniciarSesion(),
    );
  }
  @override

  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  PanelController _pc = new PanelController();

  String nomgreg = '';
  String nombre = 'Nombre Completo';
  String icono = 'nombrecompleto';
  String texto = 'Mr. Joker';
  String boton = 'Continuar';
  String nombre2 = 'E-mail';
  String icono2 = 'email';
  String texto2 = 'mr.joker@gmail.com';
  String boton2 = 'Aceptar';
  bool read = false;
  double opacity = 1;
  double opacityUnderline = 0;
  int contador = 1;

  nextRoute()  {

    Navigator.push(
      context,
      FadeRoute(
          page:  PaginaPrincipal()
      ),
    );
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: CatapultaScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "imagenes/fondoiniciarsesion.jpg"
                      ),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height - kToolbarHeight,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          nextRoute();
                        },
                        child:FittedBox(
                          child: Text(
                              'Iniciar Sesión',
                              style: GoogleFonts.poppins(
                                  textStyle: kLabelPrincipalTitleTextStyle
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,

                      ),
                      ContainerIniciarSesion(
                        title: 'E-mail',
                        obscure: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022,
                        width: MediaQuery.of(context).size.width,
                      ),
                      ContainerIniciarSesion(
                        title: 'Contraseña',
                        obscure: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SlidingUpPanel(

              controller: _pc,
              panel: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.74,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: kRadiusRegister,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          FittedBox(
                            child: Text(
                              'Bienvenido a Yourmet',
                              style: GoogleFonts.poppins(
                                  textStyle: kTituloRegistrarUsuario
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                                'Regístrate',
                                style: GoogleFonts.poppins(
                                    textStyle: kSubTituloRegistrarUsuario
                                )
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.74,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.008,
                          ),
                          Center(
                              child: ContainerRegistrar(
                                principal: nombre,
                                title: texto,
                                imagen: 'imagenes/$icono.png',
                                inputType: TextInputType.text,
                                obscure: false,
                                read: false,
                                input: nomgreg,
                              )
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Center(
                            child: ContainerRegistrar(
                              principal: nombre2,
                              title: texto2,
                              imagen: 'imagenes/$icono2.png',
                              inputType: TextInputType.emailAddress,
                              obscure: false,
                              read: false,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Center(
                            child: AnimatedOpacity(
                              duration: Duration(microseconds: 100),
                              opacity: opacity,

                              child: ContainerRegistrar(
                                principal: 'Contraseña',
                                title: '••••••••••••',
                                imagen: 'imagenes/contrasena.png',
                                inputType: TextInputType.emailAddress,
                                obscure: true,
                                read: read,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          AnimatedOpacity(
                            duration: Duration(microseconds: 100),
                            opacity: opacityUnderline,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.01),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  'Al tocar "Aceptar", acepta los Términos y Condiciones y la Política de privacidad',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: kUnderlineLabelLogin
                                  )
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.076,
                              decoration: BoxDecoration(
                                  borderRadius: kRadiusAll,
                                  border: Border.all(color: kLabelColor)
                              ),
                              child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        nombre = 'Fecha de nacimiento';
                                        icono = 'fechadenacimiento';
                                        texto = '06/12/1998';
                                        boton = 'Aceptar';
                                        ////
                                        nombre2 = 'Identificación';
                                        icono2 = 'nombrecompleto';
                                        texto2 = '1065855933';
                                        opacity = 0;
                                        opacityUnderline = 1;
                                        read = true;
                                        contador++;
                                        if(contador == 3){
                                          _pc.close();
                                          nombre = 'Nombre Completo';
                                          icono = 'nombrecompleto';
                                          texto = 'Mr. Joker';
                                          boton = 'Continuar';
                                          nombre2 = 'Nombre Completo';
                                          icono2 = 'nombrecompleto';
                                          texto2 = 'Mr. Joker';
                                          boton2 = 'Continuar';
                                          read = false;
                                          opacity = 1;
                                          contador = 1;
                                          opacityUnderline = 0;
                                        }
                                      });

                                    },
                                    child: Text(
                                      boton,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: kLabelColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400
                                        )
                                      )
                                    ),
                                  )
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
              collapsed: Container(
                decoration: BoxDecoration(
                    borderRadius: kRadiusAll,
                    color: kWhiteColor
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "¿No tienes una cuenta? ",
                            style: GoogleFonts.poppins(
                              textStyle: kLabelTextStyle,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _pc.open();
                            },
                            child: Text(
                                "Regístrate",
                                style: GoogleFonts.poppins(
                                    textStyle: kTitleTextStyle
                                )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              isDraggable: false,
              borderRadius: kRadiusAll,
              minHeight:  MediaQuery.of(context).size.height * 0.07,
              maxHeight:  MediaQuery.of(context).size.height * 0.74,
            ),
          ],
        ),
      ),
    );
  }
}



