import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_fis/components/gourmet_button.dart';
import 'package:proyecto_final_fis/controladores_de_vista/home.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final_fis/components/catapultaScrollView.dart';
 import 'package:proyecto_final_fis/components/container_iniciar_sesion.dart';
import 'package:proyecto_final_fis/components/container_registrar.dart';
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
  bool isRegisteringFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("imagenes/fondoiniciarsesion.jpg"),
                ),
              ),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PaginaPrincipal(),
                          ),
                        );
                      },
                      child: Text('Iniciar Sesión',
                          style: GoogleFonts.poppins(
                              textStyle: kLabelPrincipalTitleTextStyle)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height * 0.06, 0, 20),
                      child: ContainerIniciarSesion(
                        placeholder: 'E-mail',
                      ),
                    ),
                    ContainerIniciarSesion(
                      placeholder: 'Contraseña',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        controller: _pc,
        panel: Container(
          height: MediaQuery.of(context).size.height * 0.74,
          width: MediaQuery.of(context).size.width,
          child: CatapultaScrollView(
            child: isRegisteringFirst
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bienvenido a Gourmet',
                        style: GoogleFonts.poppins(
                            textStyle: kTituloRegistrarUsuario),
                      ),
                      Text('Regístrate',
                          style: GoogleFonts.poppins(
                              textStyle: kSubTituloRegistrarUsuario)),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            ContainerRegistrar(
                              title: "Nombre Completo",
                              icon: Icons.perm_identity_outlined,
                              placeholder: "Mr. Joker",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        child: Column(
                          children: [
                            ContainerRegistrar(
                              title: "E-mail",
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              placeholder: "mr.joker@gmail.com",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            ContainerRegistrar(
                              title: "Contraseña",
                              isPassword: true,
                              placeholder: "***********",
                              icon: Icons.lock_outline_rounded,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: AgrupaButton(),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bienvenido a Gourmet',
                        style: GoogleFonts.poppins(
                            textStyle: kTituloRegistrarUsuario),
                      ),
                      Text('Regístrate',
                          style: GoogleFonts.poppins(
                              textStyle: kSubTituloRegistrarUsuario)),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            ContainerRegistrar(
                              title: "Nombre Completo",
                              icon: Icons.perm_identity_outlined,
                              placeholder: "Mr. Joker",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        child: Column(
                          children: [
                            ContainerRegistrar(
                              title: "E-mail",
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              placeholder: "mr.joker@gmail.com",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            ContainerRegistrar(
                              title: "Contraseña",
                              isPassword: true,
                              placeholder: "***********",
                              icon: Icons.lock_outline_rounded,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: AgrupaButton(),
                      )
                    ],
                  ),
          ),
        ),
        collapsed: Container(
          decoration:
              BoxDecoration(borderRadius: kRadiusAll, color: kWhiteColor),
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
                      child: Text("Regístrate",
                          style: GoogleFonts.poppins(
                            textStyle: kTitleTextStyle,
                            decoration: TextDecoration.underline,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        isDraggable: false,
        borderRadius: kRadiusAll,
        minHeight: MediaQuery.of(context).size.height * 0.07,
        maxHeight: MediaQuery.of(context).size.height * 0.74,
      ),
    );
  }
}
