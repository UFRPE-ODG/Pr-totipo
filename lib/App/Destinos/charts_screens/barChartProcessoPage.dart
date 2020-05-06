import 'package:estudos_flutter/App/ClassesAParte/charts_models/barChartProcessos.dart';
import 'package:flutter/material.dart';

class BarChartProcessoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF3050FF),
          title: Text('Processos em aberto')),
      body: Center(
        child: Container(
          width: 500,
          height: 250,
          child: BarChartProcesso.withSampleData(),
        ),
      ),
    );
  }
}