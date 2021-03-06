import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../../config/constantes.dart';
import '../registro/iniciar_sesion.dart';
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
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => IniciarSesion(),
        ),
      );    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'imagenes/splash.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}




