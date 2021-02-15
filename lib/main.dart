import 'package:flutter/material.dart';
import 'package:proyecto_final_fis/splashScreen.dart';



void main() => runApp(Yourmet());

class Yourmet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder> {

        '/screen4' : (BuildContext context) => SplashScreen()
      },
    );
  }
}

