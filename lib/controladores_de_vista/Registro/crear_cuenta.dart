import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:proyecto_final_fis/components/gourmet_button.dart';
import 'package:proyecto_final_fis/components/iniciar_button.dart';
import 'package:proyecto_final_fis/controladores_de_vista/home.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final_fis/components/catapultaScrollView.dart';
import 'package:proyecto_final_fis/components/container_iniciar_sesion.dart';
import 'package:proyecto_final_fis/components/container_registrar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  PanelController _pc = PanelController();

  /// Variables registro
  String name = "";
  String email = "";
  String password = "";
  String phoneNumber = "";

  /// Variables de la interfaz
  bool isRegisteringFirst = true; // Evalua que mostrar en el registro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CatapultaScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CupertinoNavigationBarBackButton(
                      color: kLabelColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset("imagenes/logoInicio.png"),
                ),
                Text(
                  'Bienvenido a Gourmet',
                  style:
                      GoogleFonts.poppins(textStyle: kTituloRegistrarUsuario),
                ),
                Text('Regístrate',
                    style: GoogleFonts.poppins(
                        textStyle: kSubTituloRegistrarUsuario)),
                const SizedBox(height: 16),
                ContainerRegistrar(
                  title: "Nombre Completo",
                  icon: Icons.perm_identity_outlined,
                  placeholder: "Juan Caro",
                  onChanged: (text) {
                    setState(() {
                      name = text;
                    });
                  },
                ),
                ContainerRegistrar(
                  title: "E-mail",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  placeholder: "correo@gourmet.com",
                  onChanged: (text) {
                    setState(() {
                      email = text;
                    });
                  },
                ),
                ContainerRegistrar(
                  title: "Contraseña",
                  isPassword: true,
                  placeholder: "***********",
                  icon: Icons.lock_outline_rounded,
                  onChanged: (text) {
                    setState(() {
                      password = text;
                    });
                  },
                ),
                ContainerRegistrar(
                  title: "Celular",
                  icon: Icons.phone_outlined,
                  placeholder: "321 1234567",
                  onChanged: (text) {
                    setState(() {
                      phoneNumber = text;
                    });
                  },
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GourmetButton(
                    onPressed: () {
                      if (_canPush()) {
                        setState(() {
                          isRegisteringFirst = false;
                        });
                      } else {
                        Alert(
                            context: context,
                            title: "Crear cuenta",
                            desc: "Por favor, rellena los campos para continuar.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                                  )
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                                color: kLabelColor,
                              )
                            ]).show();
                      }
                    },
                    canPush: _canPush(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _canPush() {
    return name != "" && email != "" && password != "" && phoneNumber != "";
  }
}
