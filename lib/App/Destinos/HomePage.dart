import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'WidgetLoginState.dart';

//TELA INICIAL 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 18.0);
  ProgressDialog pr;

  Widget build(BuildContext context) {
    
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: " Loading...",
      progressWidget: (Image.asset('imagens/logo-splash.gif')),
      elevation: 20.0,
    );
    
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Container(
          height: 500.0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              
              SizedBox(height: 250.0, child: Image.asset("imagens/logo-public.png", fit: BoxFit.contain)),
              
              SizedBox(width: 220.0, child: botaoCadastrar()),

              SizedBox(width: 220.0, child: botaoLogin()),

            ]),
          ),
        ),
      )
    );
  }

  botaoCadastrar(){

    return  ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    
      child: RaisedButton(  
        color: Colors.white,
        child: Text("CADASTRAR",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Color(0xFF2626ff),
            fontWeight: FontWeight.bold
          ),
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xFF2626ff), width: 2.5),
        ),

        onPressed: (){
          pr.show();
          Future.delayed(Duration(seconds: 2)).then((value) {
            pr.hide().whenComplete(() {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => Login()
              ));
            });
          });
        }
      )
    );
  }

  botaoLogin(){
    return  ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    
      child: RaisedButton(  
        color: Color(0xFF3030ff),
        child: Text("ENTRAR",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),

        onPressed: (){
          pr.show();
          Future.delayed(Duration(seconds: 2)).then((value) {
            pr.hide().whenComplete(() {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => WidgetLogin()
              ));
            });
          });
        }
      )
    );
  }

}
