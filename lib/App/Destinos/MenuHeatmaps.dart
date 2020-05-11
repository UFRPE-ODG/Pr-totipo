
import 'package:estudos_flutter/App/Destinos/Heatnotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'HeatMap.dart';

class MenuHeat extends StatefulWidget {
  @override
  _MenuHeatState createState() => _MenuHeatState();
}

class _MenuHeatState extends State<MenuHeat> {

  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeatMaps",
          style: style.copyWith(
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Color(0xFF3050ff),
      ),

      body: Center(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                
                SizedBox(
                 child: Card(
                  color: Colors.white,
                  child: new InkWell(
                  onTap: () {
                   Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => MapSample()));
                  },
                  child: new Center(
                    child: Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            child: new Icon(
                            Icons.location_on,
                            color: Colors.blueAccent,
                            size: 50,
                          ),)
                        ),
                        SizedBox(
                          height: 50,
                          child: Text("Alunos por cidade", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 30)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                      
            ),
                SizedBox(
                 child: Card(
                  color: Colors.white,
                  child: new InkWell(
                  onTap: () {
                   Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => MapSample2()));
                  },
                  child: new Center(
                    child: Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            child: new Icon(
                            Icons.location_on,
                            color: Colors.blueAccent,
                            size: 50,
                          ),)
                        ),
                        SizedBox(
                          height: 50,
                          child: Text("Alunos com média <=3", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 30)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                      
            ),

              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
