import 'package:flutter/material.dart';
import 'package:estudos_flutter/App/ClassesAParte/Pessoa.dart';
import 'Pagina3.dart';
import 'HomePage.dart';
import 'Login.dart';
//TELA DE LOGIN
class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  
  GlobalKey<FormState> formkey = GlobalKey<FormState>();  
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
  String _login, _senha;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        SingleChildScrollView(
        child: Container(
          height: 500.0,
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: <Widget>[

                  SizedBox(height: 200.0, width: 270.0, child: Image.asset("imagens/logo-nome.jpeg", fit: BoxFit.scaleDown)),
                  
                  SizedBox(width: 300.0, child: buildTextLogin()),

                  SizedBox(width: 300.0, child: buildTextSenha()),

                  SizedBox(width: 300.0, child: buildButtonEntrar()),
                  
                ]
              ) 
            ),
          )
        ),
      )
     )
    );  
  }

  buildTextLogin() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Login",
                 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff))),
      ),

      style: style.copyWith(color: Colors.black),
      //controller: loginController,
                
      validator: (value){
        if(value.isEmpty){
          return "Informe o Login";
        }
          return null;
      },

      onSaved: (inputLogin) => _login = inputLogin,
              
    );
  }  

  buildTextSenha() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Senha",
                 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff))),
      ),

      style: style.copyWith(color: Colors.black),
      //controller: senhaController,
                
      validator: (value){
        if(value.isEmpty){
          return "Informe a sua senha";
        }
          return null;
      },

      onSaved: (inputSenha) => _senha = inputSenha,
              
    );
  }

  buildButtonEntrar(){
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      
      child: RaisedButton(
        
        color: Color(0xFF3050ff),
        child: Text("ENTRAR",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            //fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        
        onPressed: () {
          if(formkey.currentState.validate()){
            formkey.currentState.save();
            debugPrint(" Login: ${_login} \n Senha: ${_senha} \n");
            
            FocusScope.of(context).requestFocus(new FocusNode());
            
            var existe = Pessoa.construtor(_login,_senha);
            
            for(Pessoa f in listanovos){
              if(f.equals(f, existe)){
                debugPrint("Login feito com sucesso");
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pagina3()));
              }
              else{
                debugPrint("Login inexistente, cadastre antes");
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
            } 
          }
        },
      ),
    );
  }
}
//FIM TELA DE LOGIN
