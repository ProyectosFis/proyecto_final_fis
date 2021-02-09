import 'dart:async';
import 'constantes.dart';
import 'controladores_de_vista/Registro/iniciar_sesion.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Timer _timer;
  AnimationController controller;
  Animation<double> animation;

  initState2() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn
    );
    controller.forward();
  }



  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onShowLogin() {
    if(mounted){
      Navigator.of(context).pushReplacement(IniciarSesion.route());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image(
                image: AssetImage(
                  'imagenes/yourmetlogo.png'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




