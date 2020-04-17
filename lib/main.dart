import 'package:flutter/material.dart';
import 'Detalhes/Pessoa.dart';
import 'Detalhes/HomePage.dart';

void main() => runApp(MyApp());
var novos = new Pessoa();
var listanovos = new List<Pessoa>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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



