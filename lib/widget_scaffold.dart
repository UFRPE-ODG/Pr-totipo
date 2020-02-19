import 'package:flutter/material.dart';

widgetScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Do Gerah"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white
      ),
      drawer: Container(
        color: Colors.green
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.black,
        onPressed: () {print("Pressionado mano");},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 40.00,
          child: Row(
            children: <Widget>[
              Text("Meu bagui ai"),
            Icon(Icons.home)],
          ),
        ), 
        color: Colors.purple
      ),
      persistentFooterButtons: <Widget>[
        IconButton(icon: Icon(Icons.add_alarm),
        onPressed: null)
      ],
    );
  }