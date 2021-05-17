import 'package:flutter/material.dart';
import 'package:yuyay_app/src/pages/beneficios/beneficiosPage.dart';
import 'package:yuyay_app/src/pages/beneficios/funcionesPage.dart';
import 'package:yuyay_app/src/pages/beneficios/organosPage.dart';
import 'package:yuyay_app/src/pages/beneficios/productosPage.dart';
import 'package:yuyay_app/src/pages/beneficios/sistemasPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => BeneficiosPage(),
        'funciones' : (BuildContext context) => FuncionesPage(),
        'organos' : (BuildContext context) => OrganosPage(),
        'sistemas' : (BuildContext context) => SistemasPage(),
        'productos' : (BuildContext context) => ProductosPage(),

      },
    );
  }
}