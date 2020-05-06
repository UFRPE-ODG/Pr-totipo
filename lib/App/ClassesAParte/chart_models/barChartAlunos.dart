import 'package:estudos_flutter/App/ClassesAParte/charts_data/dados.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartAluno extends StatelessWidget {
  final List<charts.Series> serieslist;
  final bool animation;

  BarChartAluno(this.serieslist, {this.animation});

  factory BarChartAluno.withSampleData() {
    return new BarChartAluno(dadosAlunosPesquisados(), animation: false);
    /*Essa função serve para que o widget possa ser chamado e
    utilizado sem precisar do construtor*/
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      serieslist,
      animate: animation,
      defaultInteractions: false,
      behaviors: [
        new charts.ChartTitle(
          'Número de alunos pesquisados',
          subTitle: 'Ano: 2020',
          behaviorPosition: charts.BehaviorPosition.top,
          titleOutsideJustification: charts.OutsideJustification.start,
          titleStyleSpec: charts.TextStyleSpec(fontSize: 16),
        )
      ],
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec:
        new charts.BasicNumericTickProviderSpec(desiredTickCount: 8),
      ),
      /*Nesse return é onde as propriedades do gráfico podem ser
      modificadas, como colocar títulos, definir se terá animações
      ou não, dentre outras coisas*/
    );
  }
}