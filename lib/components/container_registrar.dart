import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_final_fis/config/constantes.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerRegistrar extends StatelessWidget {
  ContainerRegistrar(
      {this.title,
      this.placeholder,
      this.keyboardType,
      this.isPassword,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.icon,
      this.iconColor,
      this.initialValue,
      this.textCapitalization,
      this.validationText,
      this.autofocus,
      this.maxLength,
      this.textInputFormatters,
      this.prefixWidget,
      this.key,
      this.width,
      this.enabled,
      this.onFieldSubmitted,
      this.suffixText});

  Key key;
  String placeholder;
  TextInputType keyboardType;
  bool isPassword;
  Function onChanged;
  Function onTap;
  Function onEditingComplete;
  Color iconColor;
  String initialValue;
  TextCapitalization textCapitalization;
  String validationText;
  bool autofocus;
  int maxLength;
  String title;
  List<TextInputFormatter> textInputFormatters;
  Widget prefixWidget;
  double width;
  bool enabled = true;
  Function onFieldSubmitted;
  String suffixText;
  var icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Text(
              title,
              style: GoogleFonts.poppins(textStyle: kLabelRegistrar),
            ),
          ),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kWhiteColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: kDividerColor,
                    blurRadius: 3.0,
                    offset: Offset(0.2, 0.7))
              ],
              borderRadius: kRadiusAll,
            ),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 23,
                ),
                Icon(
                  icon,
                  color: kLabelColor,
                  size: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Container(
                    width: 1,
                    height: 45,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor),
                          borderRadius: kRadiusAll,
                          color: kWhiteColor),
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: TextFormField(
                          key: key,
                          enabled: enabled,
                          autofocus: autofocus ?? false,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          keyboardAppearance: Brightness.light,
                          textCapitalization:
                              textCapitalization ?? TextCapitalization.none,
                          initialValue: initialValue,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: placeholder,
                            suffixText: suffixText ?? "",
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 15),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          inputFormatters: textInputFormatters ?? [],
                          keyboardType: keyboardType ?? TextInputType.text,
                          obscureText: isPassword ?? false,
                          onChanged: onChanged,
                          onTap: onTap,
                          onEditingComplete: onEditingComplete,
                          onFieldSubmitted: onFieldSubmitted,
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
