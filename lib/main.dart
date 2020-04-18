import 'package:estudos_flutter/Detalhes/Projetos.dart';
import 'package:flutter/material.dart';
import 'Detalhes/Pessoa.dart';
import 'Detalhes/HomePage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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



