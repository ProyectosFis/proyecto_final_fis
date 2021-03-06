import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final_fis/components/catapultaScrollView.dart';
import 'package:proyecto_final_fis/config/constants/user_constants.dart';
import 'package:proyecto_final_fis/screens/perfil/configuracion.dart';
import 'package:proyecto_final_fis/config/constantes.dart';
import 'package:proyecto_final_fis/components/container_perfil.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1,
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Perfil',
                  style: GoogleFonts.poppins(textStyle: kTituloPremium),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.07,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Configuracion(),
                              ),
                            );
                          },
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('imagenes/configurar.png'),
                          )),
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
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 1,
                      color: kBlackColor.withOpacity(0.1),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.115,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      IconTheme(
                        data: IconThemeData(
                          color: kLabelColor,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.058,
                          height: MediaQuery.of(context).size.height * 0.058,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'imagenes/imagenperfil.png',
                                  ))),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${user.name}",
                                  style: GoogleFonts.poppins(
                                      textStyle: kLabelPerfil),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Actualizar datos',
                                  style: GoogleFonts.poppins(
                                      textStyle: kLabelTextStyle),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 1,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                )
              ],
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Center(
              child: ContainerPerfil(
                principal: 'E-mail',
                title: "${user.email}",
                imagen: 'imagenes/email.png',
              ),
            ),
            Center(
              child: ContainerPerfil(
                principal: 'Celular',
                title: "${user.phoneNumber}",
                imagen: 'imagenes/fechadenacimiento.png',
              ),
            ),

          ],
        ),
      ),
    );
  }
}
