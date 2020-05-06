import 'package:estudos_flutter/App/ClassesAParte/chart_models/lineChart.dart';
import 'package:flutter/material.dart';

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF3050FF),
          title: Text('Alunos aprovados por semestre')),
      body: Center(
        child: Container(
          width: 500,
          height: 250,
          child: LineChart.withSampleData(),
        ),
      ),
    );
  }
}