import 'package:flutter/material.dart';
import 'package:estudos_flutter/App/ClassesAParte/Pessoa.dart';
import 'HomePage.dart';

var novos = new Pessoa();
var listanovos = new List<Pessoa>();


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
  
}
class _LoginState extends State<Login> {
  
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();  
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

  String _email = "";
  String _password = "";


  @override
  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  _emailListen() {
    if (_emailFilter.text.isEmpty) {
       return Text("Informe a senha");
    } else {
      _email = _emailFilter.text;
    }
  }

  _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
       return Text("Informe o email");
    } else {
      _password = _passwordFilter.text;
    }
  }

  initState() {
    super.initState();
    _LoginPageState();
  }

  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 500.0,
          child: Center(
            child: Form(
              key: formkey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: <Widget>[

                  Text(
                    "Criar Nova Conta",
                    style: style.copyWith(
                      color: Color(0xFF3030ff),
                      fontSize: 25.0
                    ),
                  ),
                  
                  SizedBox(width: 300.0, child: campoLoginCadastro()),

                  SizedBox(width: 300.0, child:campoNomeCadastro()),
    
                  SizedBox(width: 300.0, child:campoSenhaCadastro()),

                  SizedBox(width: 300.0, child:campoConfirmarSenha()),

                  SizedBox(width: 300.0, child:botaoFazerCadastro()),            

                ],
              ),
            ),
          )
        ),
      ),
    );
  }
  
  campoLoginCadastro() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Login",
                            
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),
                        
      validator: (value){
        if(value.isEmpty){
          return "Informe o Login";
        }
          return null;
        },

        controller: _emailFilter,   

    );
  }

  campoNomeCadastro(){
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Nome",
                    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),

                      
      validator: (value){
        if(value.isEmpty){
          return "Informe seu nome";
        }
          return null;
      },  
    );
  }

  campoSenhaCadastro(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Senha",
                    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),
               
      validator: (value){
        if(value.isEmpty){
          return "Informe a sua senha";
        }
          return null;
      },

      controller: _passwordFilter,
           
    );
  }
 var  confirm;
  campoConfirmarSenha(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Confirme a senha",
                    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),
               
      validator: (value){
        confirm = value;
        if(value.isEmpty || value != _password){
          return "As senhas não correspondem!";
        }
         return null;
      },        
    );
  }

  botaoFazerCadastro(){
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    
      child: RaisedButton(
        color: Colors.white,
        child: Text("CADASTRAR",
          textAlign: TextAlign.center,
          style: style.copyWith(
          color: Color(0xFF3030ff),
          fontSize: 20.0,
          fontWeight: FontWeight.bold
          ),
        ),
                      
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xFF3030ff), width: 2.5),
        ),

        onPressed: () => {
                      
          formkey2.currentState.validate(),
                      
          if(_email.isNotEmpty & _password.isNotEmpty){
            
            novos = Pessoa.construtor(_email,_password),
                        
            if(!listanovos.contains(novos)){
              listanovos.add(novos),  
              debugPrint("Cadastrado com sucesso"),
            },
            if(confirm == _password){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
            }
            

          }           
          else{
            debugPrint("Informações necessárias não informadas")
          }

        },
      ),
    );
  }

}

