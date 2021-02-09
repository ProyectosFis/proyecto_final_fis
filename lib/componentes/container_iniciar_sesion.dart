import 'package:flutter/material.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerIniciarSesion extends StatelessWidget {


  ContainerIniciarSesion({
    @required this.title,
    this.obscure,

  });
  final String title;
  final bool obscure;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: kRadiusAll,
          border: Border.all(color: kWhiteColor)
      ),
      child: Center(
        child: TextFormField(
          style: kLabelTextFormFieldStyle,
          obscureText: obscure,
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          decoration:
          InputDecoration.collapsed(
              hintText: title,
              hintStyle: GoogleFonts.poppins(
                  textStyle: kLabelTextFormFieldStyle
              )
          ),
        ),
      ),
    );
  }
}
