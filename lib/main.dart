import 'package:estudos_flutter/App/Destinos/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:estudos_flutter/App/Destinos/Listagem.dart';


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
      home: HomePage()
    );
  }
}



