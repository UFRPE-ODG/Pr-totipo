import 'package:flutter/material.dart';

Center widgetText() {
    return Center(
        child: Text("Dale, Dale", 
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.purple,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Colors.green,
          decorationStyle: TextDecorationStyle.double
        )),
      );
  }