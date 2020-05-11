import 'package:estudos_flutter/App/Destinos/Heatnotas.dart';
import 'package:flutter/material.dart';

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
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(20.0),
 
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      
                      child: ListTile(
                        
                        leading: Icon(Icons.place, 
                          color: Colors.blueAccent,
                          size: 45.0,
                        ),

                        title: Text('Alunos Por Cidade',
                          style: style.copyWith(
                            fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 20
                          ),
                        ),
                        
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => MapSample()));
                        },
                      ),
                      
                    )
                  ),
                ),
                
                SizedBox(
                  child: Card(
                    elevation: 0.0,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      
                      child: ListTile(
                        
                        leading: Icon(Icons.place, 
                          color: Colors.blueAccent,
                          size: 45.0,
                        ),

                        title: Text('Alunos com notas <= 3',
                          style: style.copyWith(
                            fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 20
                          ),
                        ),
                        
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => MapSample2()));
                        },
                      ),
                      
                    )
                  ),
                )

              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
