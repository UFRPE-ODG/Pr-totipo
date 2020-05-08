import 'package:estudos_flutter/App/ClassesAParte/chart_models/barChartAlunos.dart';
import 'package:estudos_flutter/App/ClassesAParte/chart_models/barChartProcessos.dart';
import 'package:estudos_flutter/App/ClassesAParte/chart_models/lineChart.dart';
import 'package:estudos_flutter/App/ClassesAParte/chart_models/pieChart.dart';
import 'package:estudos_flutter/App/Destinos/charts_screens/pieChartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'barChartAlunoPage.dart';
import 'barChartProcessoPage.dart';
import 'lineChartPage.dart';

Material cardDisplay(Widget chart) {
  return Material(
    color: Colors.white,
    elevation: 2.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(4.0),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: chart,
      ),
    ),
  );
}

class DashboardPage extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3050FF) ,
        title: Text("Dashboard",
          style: style.copyWith(
            fontSize: 25.0,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarChartPage()),
                );
              },
              child: cardDisplay(BarChartAluno.withSampleData())),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PieChartPage()),
                );
              },
              child: cardDisplay(PieChart.withSampleData())),
          InkWell(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BarChartProcessoPage()),
            );
          },
              child: cardDisplay(BarChartProcesso.withSampleData())),
          InkWell(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LineChartPage()),
            );

          },
              child: cardDisplay(LineChart.withSampleData())),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 340),
          StaggeredTile.extent(2, 170),
          StaggeredTile.extent(2, 170),
          StaggeredTile.extent(2, 170),
        ],
      ),
    );
  }
}