import 'package:estudos_flutter/App/Destinos/splashscreen.dart';
import 'App/Destinos/Listagem.dart';
import 'package:flutter/material.dart';
import 'App/Destinos/HomePage.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    lista();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue  
      ),
      home: SplashPage()
    );
  }
}



