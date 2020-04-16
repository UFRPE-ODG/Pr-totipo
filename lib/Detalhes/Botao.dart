import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class Botao extends StatelessWidget {
  final bool checked;

  Botao({this.checked});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTrackTween([
      Track("paddingLeft")
          .add(Duration(milliseconds: 1000), Tween(begin: 0.0, end: 20.0)),
      Track("color").add(Duration(milliseconds: 1000),
          ColorTween(begin:  Colors.white, end: Colors.blue)),
      Track("rotation")
          .add(Duration(milliseconds: 1000), Tween(begin: -2 * 3.14, end: 0.0)),
    ]);

    return ControlledAnimation(
      playback: checked ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      startPosition: checked ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildCheckbox,
    );
  }

Widget _buildCheckbox(context, animation) {
    return Container(
      decoration: _outerBoxDecoration(animation["color"]),
      width: 50,
      height: 30,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(left: animation["paddingLeft"]),
            child: Transform.rotate(
              angle: animation["rotation"],
              child: Container(
                decoration: _innerBoxDecoration(animation["color"]), 
                width: 20,
              ),
            ),
          ))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      color: Color(0xFFEEEEff),
      border: Border.all(
          width: 2,
          color: color,
        ),
      );

  BoxDecoration _outerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
        color: Color(0xFFc8e9ff),
        border: Border.all(
          width: 2,
          color: color,
        ),
      );

  static final labelStyle = TextStyle(
      height: 1.2,
      fontWeight: FontWeight.bold,
      fontSize: 9,
      color: Colors.white);
}