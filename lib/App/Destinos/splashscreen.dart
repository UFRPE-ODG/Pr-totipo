import 'package:estudos_flutter/App/Destinos/WidgetLoginState.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';



class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  @override
  
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
      () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => WidgetLogin())
      )
    );
    
  }
  
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Color(0xFF0303ff),
          navigateAfterSeconds: WidgetLogin(),
          loaderColor: Colors.transparent,    
        ),
        Center(
          child: Container(
            child: SizedBox(width: 250.0 ,child: Image.asset("imagens/logo-branca.png", fit: BoxFit.contain,))
            
            
          ),
        ),
      ],
    );
    
    
  }
}

