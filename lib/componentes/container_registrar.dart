import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerRegistrar extends StatelessWidget {
  ContainerRegistrar({
    @required this.principal,
    @required this.title,
    @required this.imagen,
    @required this.inputType,
    this.obscure,
    this.read,
    this.input

  });
  final String principal;
  final String title;
  final String imagen;
  final TextInputType inputType;
  final bool obscure;
  bool read = false;
  String input = '';


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.115,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.014,
              ),
              Text(
                principal,
                style: GoogleFonts.poppins(
                  textStyle: kLabelRegistrar
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.007,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.064,
            width: MediaQuery.of(context).size.height * 0.94,
            decoration: BoxDecoration(
              color: kWhiteColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: kDividerColor,
                  blurRadius: 3.0,
                  offset: Offset(0.2, 0.7)
                )
              ],
              borderRadius: kRadiusAll,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.024,
                ),
                IconTheme(
                  data: IconThemeData(
                    color: kLabelColor,
                  ),
                  child: ImageIcon(
                    AssetImage(
                      imagen
                    )
                  ),
                ),
                SizedBox(
                  width: 23,
                ),
                Container(
                  width: 1,
                  height: MediaQuery.of(context).size.height * 0.045,
                  color: kDividerColor,
                ),
                SizedBox(
                  width: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kWhiteColor),
                        borderRadius: kRadiusAll,
                        color: kWhiteColor
                      ),
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.002, 0, MediaQuery.of(context).size.height * 0.002),
                        child: TextFormField(
                          readOnly: read,
                          obscureText: obscure,
                          cursorColor: kLabelColor,
                          keyboardType: inputType,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: kBlackColor),
                          decoration: InputDecoration.collapsed(
                            hintText: title,
                            hintStyle: TextStyle(
                              color:kBlackColor.withOpacity(0.3)
                            ),
                          ),
                          onSaved: (text) => input = text,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}