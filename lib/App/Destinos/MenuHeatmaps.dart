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
        title: Text("HeatMaps"),
        centerTitle: true,
        backgroundColor: Color(0xFF3030ff),
      ),

      body: Center(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                
                SizedBox(
                  child: Card(
                    elevation: 10.0,
                    color: Color(0xFFbbbbff),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      
                      child: ListTile(
                        
                        leading: Icon(Icons.place, 
                          color: Color(0xFF3030ff),
                          size: 45.0,
                        ),

                        title: Text('Alunos Por Cidade',
                          style: style.copyWith(
                            color: Color(0xFF3030ff),
                            fontSize: 23.0,
                          ),
                        ),
                        
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => MapSample()));
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
