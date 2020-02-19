 import 'package:flutter/material.dart';

buildListView() {
    return ListView(
      children: <Widget>[

        ListTile(
          leading: Icon(Icons.add_box),
          title: Text("Quem sou eu??"),
          subtitle: Text("Tu é Lucas, Pow!"),
          trailing: Icon(Icons.add_circle),
          selected: true,
          onTap: () {
            print("ok");
          },
        ),

        ListTile(
          leading: Icon(Icons.add_comment),
          title: Text("Qual minha idade??"),
          subtitle: Text("Tu tem 18 bixo!"),
          trailing: Icon(Icons.add_to_queue),
          enabled: true,
          onLongPress: () {
            print("eita");
          },
        ),

        

      ],
    );
  }
