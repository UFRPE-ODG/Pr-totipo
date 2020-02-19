 import 'package:estudos_flutter/widget_raisedbutton.dart';
import 'package:flutter/material.dart';

widgetRowColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        widgetButton(),
        widgetButton(),
        widgetButton(),
      ],
    );
  }