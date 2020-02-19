import 'package:flutter/material.dart';

widgetButton() {
    return RaisedButton(
      color: Colors.purple,
      textColor: Colors.white,
      elevation: 20.0,
      child: Text("Botão"),
      onPressed: () {
        print("pressionado");
      },
    );
  }