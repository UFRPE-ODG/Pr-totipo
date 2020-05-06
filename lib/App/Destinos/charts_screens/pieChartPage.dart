import 'package:estudos_flutter/App/ClassesAParte/charts_models/pieChart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF3050FF),
          title: Text('Gráfico de nota média')),
      body: Center(
        child: Container(
          width: 500,
          height: 250,
          child: PieChart.withSampleData(),
        ),
      ),
    );
  }
}