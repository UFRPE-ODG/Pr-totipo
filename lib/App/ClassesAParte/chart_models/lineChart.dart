import 'package:estudos_flutter/App/ClassesAParte/charts_data/dados.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatelessWidget {
  final List<charts.Series> serieslist;
  final bool animation;

  LineChart(this.serieslist, {this.animation});

  factory LineChart.withSampleData() {
    return new LineChart(dadosAlunosAprovados(), animation: false);
    /*Essa função serve para que o widget possa ser chamado e
    utilizado sem precisar do construtor*/
  }

  @override
  Widget build(BuildContext context) {
    final statickticks = <charts.TickSpec<double>>[
      new charts.TickSpec(2018.1, label: '2018.1'),
      new charts.TickSpec(2018.6, label: '2018.2'),
      new charts.TickSpec(2019.1, label: '2019.1'),
      new charts.TickSpec(2019.6, label: '2019.2'),
    ];

    return charts.LineChart(
      serieslist,
      animate: false,
      defaultInteractions: false,
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec:
        new charts.BasicNumericTickProviderSpec(desiredTickCount: 6),
      ),
      domainAxis: new charts.NumericAxisSpec(
          viewport: new charts.NumericExtents(2018, 2019.6),
          tickProviderSpec:
          new charts.StaticNumericTickProviderSpec(statickticks)),
      behaviors: [
        new charts.ChartTitle('Alunos aprovados por semestre',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
            titleStyleSpec: charts.TextStyleSpec(fontSize: 16),
            subTitle: 'Sem reprovação em nenhuma cadeira'),

      ],
    );
  }
}