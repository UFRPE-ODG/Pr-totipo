import 'package:flutter/material.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
 
  @override
  Widget build(BuildContext context) {
    
    final loginField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Login",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );
    
    final senhaField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Senha",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      
      child: RaisedButton(
        color: Colors.black,
        child: Text("Entrar", textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ),
        
        onPressed: () {},
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        )

      ),
    );

    return Scaffold(
      
      backgroundColor: Colors.white,
      
      body: Center(
        child: SingleChildScrollView(
                  child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 150.0, child: Image.asset("imagens/login.png", fit: BoxFit.contain)),
                SizedBox(height: 40.0), loginField,
                SizedBox(height: 20.0), senhaField,
                SizedBox(height: 30.0), buttonLogin,
              ],
            )
          ),
        )
      )
      
    );
  }
}