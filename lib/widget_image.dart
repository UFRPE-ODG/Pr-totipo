import 'package:flutter/material.dart';

widgetImage() {
    return SizedBox.expand(
      child: Image.asset("imagens/batimahNebula.png",
        height: 300.0,
        width: 300.0,
        fit: BoxFit.cover
      ),
    );
  }