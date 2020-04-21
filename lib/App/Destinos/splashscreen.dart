import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'HomePage.dart';


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
        builder: (context) => HomePage())
      )
    );
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    /*
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFF0303ff)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('imagens/logo-branca.png', height: 250.0,),
            
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Carregando...", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                )
              )
            ],
          )
        ],
      ),
    );
    */
    
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Color(0xFF0303ff),
          navigateAfterSeconds: HomePage(),
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

