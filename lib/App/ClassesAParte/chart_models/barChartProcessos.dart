import 'package:charts_flutter/flutter.dart' as charts;
import 'package:estudos_flutter/App/ClassesAParte/charts_data/dados.dart';
import 'package:flutter/cupertino.dart';


class BarChartProcesso extends StatelessWidget {
  final List<charts.Series> serieslist;
  final bool animate;

  BarChartProcesso(this.serieslist, {this.animate});

  factory BarChartProcesso.withSampleData() {
    return new BarChartProcesso(
      dadosProcessos(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      serieslist,
      animate: animate,
      defaultInteractions: false,
      behaviors: [
        new charts.ChartTitle(
          'Processos em aberto',
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