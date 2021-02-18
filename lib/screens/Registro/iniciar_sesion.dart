import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:proyecto_final_fis/components/gourmet_button.dart';
import 'package:proyecto_final_fis/screens/Registro/crear_cuenta.dart';
import 'package:proyecto_final_fis/screens/home.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final_fis/components/catapultaScrollView.dart';
import 'package:proyecto_final_fis/components/container_registrar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class IniciarSesion extends StatefulWidget {
  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  PanelController _pc = PanelController();

  /// Variables inicio de sesión
  String emailLoginIn = "";
  String passwordLoginIn = "";

  /// Variables de la interfaz
  bool isRegisteringFirst = true; // Evalua que mostrar en el registro

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CatapultaScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset("imagenes/logoInicio.png"),
                ),
                Text(
                  'Bienvenido a Gourmet',
                  style:
                  GoogleFonts.poppins(textStyle: kTituloRegistrarUsuario),
                ),
                Text('Inicia sesión',
                    style: GoogleFonts.poppins(
                        textStyle: kSubTituloRegistrarUsuario)),
                const SizedBox(height: 16),
                Text('Iniciar Sesión',
                    style: GoogleFonts.poppins(
                        textStyle: kLabelPrincipalTitleTextStyle)),
                ContainerRegistrar(
                  title: "E-mail",
                  icon: Icons.email_outlined,
                  placeholder: 'E-mail',
                  onChanged: (text) {
                    setState(() {
                      emailLoginIn = text;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ContainerRegistrar(
                  title: "Contraseña",
                  icon: Icons.lock_outline_rounded,
                  placeholder: 'Contraseña',
                  onChanged: (text) {
                    setState(() {
                      passwordLoginIn = text;
                    });
                  },
                  isPassword: true,
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GourmetButton(
                    onPressed: () {
                      if(_canPush()){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PaginaPrincipal(),
                          ),
                        );
                      }else{
                        Alert(
                            context: context,
                            title: "Iniciar sesión",
                            desc: "Por favor, rellena los campos para continuar.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white, fontSize: 20),
                                    )                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                                color: kLabelColor,
                              )
                            ]).show();
                      }
                    },
                    canPush: _canPush(),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CrearCuenta(),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  child:RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "¿No tienes una cuenta?,",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: kLabelColor
                        )
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " regístrate",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kLabelColor
                              )
                          ),                        ),

                      ],
                    ),
                  )


                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _canPush() {
    return emailLoginIn != "" && passwordLoginIn != "";
  }
}
