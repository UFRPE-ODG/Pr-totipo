import 'package:flutter/material.dart';
import 'Detalhes/Pessoa.dart';
import 'dart:convert';
import 'Detalhes/API.dart';
import 'Detalhes/Configuracao.dart';
import 'Detalhes/Perfil.dart';
import 'Detalhes/Mensagem.dart';
import 'Detalhes/Botao.dart';


void main() => runApp(MyApp());
var novos = new Pessoa();
var listanovos = new List<Pessoa>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue  
      ),
      home: HomePage()
    );
  }
}

//TELA INICIAL 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 18.0);

  Widget build(BuildContext context) {
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
        child: Text("SIGN UP",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Color(0xFF2626ff),
            //fontWeight: FontWeight.bold
          ),
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color(0xFF2626ff), width: 2.5),
        ),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Login())
          );
        }
      )
    );
  }

  botaoLogin(){
    return  ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    
      child: RaisedButton(  
        color: Color(0xFFff9903),
        child: Text("LOGIN",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            //fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => WidgetLogin())
          );
        }
      )
    );
  }

}
//FIM TELA INICIAL


class Pag2 extends StatefulWidget {
  @override
  _Pag2State createState() => _Pag2State();
}

class _Pag2State extends State<Pag2> {
  var users = new List<Pessoa>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => Pessoa.fromJson(model)).toList();
        pre();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  pre(){
    if(listanovos!=null){ 
      users.addAll(listanovos);   
    }
  }

  String alo="fim";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        title: Text("Pessoas cadastradas"),
        backgroundColor: Color(0xFF2626ff),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check), 
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      ),
      
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            if(users[index].nome!=null){
               alo = users[index].nome;
            }
            return ListTile(title: Text(alo,style: TextStyle(color: Colors.blue,fontSize: 30),textAlign: TextAlign.center,));
          },
        )      
    );
  }
}

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
        child: Container(
          height: 500.0,
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: <Widget>[

                  SizedBox(height: 240.0, child: Image.asset("imagens/logo-public.png", fit: BoxFit.scaleDown)),
                  
                  SizedBox(width: 300.0, child: buildTextLogin()),

                  SizedBox(width: 300.0, child: buildTextSenha()),

                  SizedBox(width: 200.0, child: buildButtonEntrar()),
                  
                ]
              ) 
            ),
          )
        ),
      ) 
    );  
  }

  buildTextLogin() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Login",
                 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff))),
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
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff))),
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
        
        color: Color(0xFFff9903),
        child: Text("Entrar",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
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
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
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
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
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
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
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
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
          borderSide: BorderSide(color: Color(0xFF2626ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0), 
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
        color: Color(0xFFff9903),

        child: Text("Cadastrar",
          textAlign: TextAlign.center,
          style: style.copyWith(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold
          ),
        ),
                      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
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



class Pagina3 extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app,size: 40,), 
        backgroundColor: Colors.orangeAccent ,
        
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF0303ff),
      
        title: Text(
          "Bem-vindo(a)!",
          style: style.copyWith(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
       
      ),
      bottomNavigationBar: 
      BottomNavigationBar(
        backgroundColor: Color(0xFF0303ff),
        currentIndex: 2,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message,color: Colors.white,), title: Text("Mensagem", style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.white), title: Text("Configurações",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), title: Text("Perfil",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
        ],
      ),
      drawer: menu(context), 
      body: Center( 
        child: Container(
          height: 500.0,
          color: Colors.white,
          
          child: Column(
            children: <Widget>[
              
              SizedBox(
                width: 300,
                child: Text(
                  "Esse é uma visão de como será a plataforma do ODG",
                  style: style.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ]
          )
        )
        
      )
      
    );
  }
}


var imagemdefundo = "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg";
var fotodeperfil = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

menu(BuildContext context){
TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
return Drawer(
    child: ListView(
      padding: EdgeInsets.zero, 
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("João Pedro",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent,)),
           accountEmail: Text("JoaoPedro@gmail.com",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent,)),
           currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(fotodeperfil),
                ),),
           decoration: BoxDecoration(
             image: DecorationImage(
               fit: BoxFit.fill,
               image: NetworkImage(imagemdefundo),),
           ),),   
        ListTile(
          leading: Icon(Icons.message,color: Colors.blueAccent,),
          title: Text('Messages',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent,)),
           onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Mensagem()));
              }
        ),
        ListTile(
          leading: Icon(Icons.account_circle, color: Colors.blueAccent,),
          title: Text('Perfil',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent)),
           onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Perfil()));
              }
        ),
        ListTile(
           title: Text('Configurações',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent)),
           leading: Icon(Icons.settings, color: Colors.blueAccent),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Configuracao()));
              }
         
          
        ),

      ],
    ),);
}
