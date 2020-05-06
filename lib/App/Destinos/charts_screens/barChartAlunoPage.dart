import 'package:estudos_flutter/App/ClassesAParte/charts_models/barChartAlunos.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF3050FF),
          title: Text('Número de Alunos Pesquisados')),
      body: Center(
        child: Container(
          width: 500,
          height: 250,
          child: BarChartAluno.withSampleData(),
        ),
      ),
    );
  }
}