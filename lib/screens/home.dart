import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_fis/screens/favoritos/favoritos.dart';
import 'package:proyecto_final_fis/constantes.dart';
import 'package:proyecto_final_fis/components/catapultaScrollView.dart';
import 'package:proyecto_final_fis/screens/inicio/inicio.dart';
import 'package:proyecto_final_fis/screens/perfil/perfil.dart';


class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Buscar(),
    Favoritos(),
    Perfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CatapultaScrollView(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: kWhiteColor  ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('imagenes/busqueda.png')),
            title: Text(''),
            activeIcon: ImageIcon (AssetImage('imagenes/busquedal.png'))
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('imagenes/favoritos.png')),
            title: Text(''),
            activeIcon: ImageIcon (AssetImage('imagenes/favoritol.png'))
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('imagenes/perfil.png')),
            title: Text(''),
            activeIcon: ImageIcon (AssetImage('imagenes/perfill.png'))
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:kLabelColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 5,
        onTap: _onItemTapped,
      ),
    );
  }
}


