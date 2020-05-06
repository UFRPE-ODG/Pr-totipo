import 'package:estudos_flutter/App/ClassesAParte/charts_data/dados.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class PieChart extends StatelessWidget {
  final List<charts.Series> serieslist;
  final bool animate;

  PieChart(this.serieslist, {this.animate});

  factory PieChart.withSampleData() {
    return new PieChart(
      dadosAlunosNotas(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      serieslist,
      animate: animate,
      defaultInteractions: false,
      behaviors: [
        new charts.DatumLegend(
            position: charts.BehaviorPosition.end,
            outsideJustification: charts.OutsideJustification.endDrawArea),
        new charts.ChartTitle(
          'Alunos por nota média',
          behaviorPosition: charts.BehaviorPosition.top,
          titleOutsideJustification: charts.OutsideJustification.start,
          titleStyleSpec: charts.TextStyleSpec(fontSize: 16),
        )
      ],
    );
  }
}