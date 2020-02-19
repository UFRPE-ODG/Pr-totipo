import 'package:flutter/material.dart';

class widgetCorPref extends StatefulWidget {
  @override
  _widgetCorPrefState createState() => _widgetCorPrefState();
}

class _widgetCorPrefState extends State<widgetCorPref> {
  
  String nomeCor = "";
  
  @override
  Widget build(BuildContext context) {

    debugPrint("### widget foi criado ###");

    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget"),
      ),
      
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            
            TextField(
              onSubmitted: (String texto){
                
                setState(() {
                  debugPrint("### SetState Chamado ###");
                  nomeCor = texto;
                });
                
              },
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("A sua cor preferida é: $nomeCor", 
              style: TextStyle(fontSize: 20.0)),
            )
          ],
        ),
      )
    );
  }
}