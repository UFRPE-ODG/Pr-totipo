import 'dart:convert';

import 'package:estudos_flutter/api.dart';
import 'package:estudos_flutter/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Http-Json-ListView",
      
      home: BuildListViewJson(), 
    );
  }
}



class BuildListViewJson extends StatefulWidget {
  @override
  _BuildListViewJsonState createState() => _BuildListViewJsonState();
}

class _BuildListViewJsonState extends State<BuildListViewJson> {
  
  static var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewJsonState() {
    _getUsers();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lista de Usuarios"),
      ),
      
      body: listaUsuarios(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => InserirUser()
            )
          );
        },
      ),
    );
  }

  listaUsuarios() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple,
            backgroundImage: NetworkImage("https://image.flaticon.com/icons/png/512/64/64572.png"),

          ),
        
          title: Text(
            users[index].name,
            style: TextStyle(fontSize:20.0, color: Colors.black)
          ),
          subtitle: Text(users[index].email),

          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => DetailPage(users[index])
              )

            );
          },

        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
 
  final User user;

  DetailPage(this.user);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(user.name)
      ), 
      body: userDetails(),
    );
  }

  userDetails() {
    return ListView(padding: EdgeInsets.all(32.0),
      children: <Widget>[ 

        ListTile(
          title: Text(user.username,
            style: TextStyle(fontWeight: FontWeight.w500)
          ),
          leading: Icon(Icons.account_circle, color: Colors.purple),
        ),

         ListTile(
          title: Text(user.email,
            style: TextStyle(fontWeight: FontWeight.w500)
          ),
          leading: Icon(Icons.email, color: Colors.purple),
        )

      ]
    );

  }

}

class InserirUser extends StatefulWidget {
  @override
  _InserirUserState createState() => _InserirUserState();
}

class _InserirUserState extends State<InserirUser>  {
  @override

  final formKey = GlobalKey<FormState>();
  String nome, username, email = "";

  TextStyle estilo = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);

  User newUser;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Novo Usuário"),
      ),

      body: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                //CAMPO ID
                /*TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "ID:",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  
                  onSaved: (inputId) => id = inputId,
                   
                ),*/

                //CAMPO NOME
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Nome:",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  
                  onSaved: (inputName) => nome = inputName,
                   
                ),

                //CAMPO USERNAME
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Username",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  
                  onSaved: (inputUser) => username = inputUser,
                   
                ),

                //CAMPO EMAIL
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Email:",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  
                  validator: (inputEmail) => inputEmail.contains('@') ? null : "Este email não é valido",
                  onSaved: (inputEmail) => email = inputEmail,
                   
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: RaisedButton(  
                        color: Colors.black,
                        child: Text("Salvar", textAlign: TextAlign.center,
                        style: estilo.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)
                        ),
        
                        onPressed: () {
                        
                          submissao();
                          
                        },
        
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                        )

                      ),
                    )
                  ],
                )


              ],
            ),
          ),
        )
      )
      
    );
  }

  void submissao(){

    if(formKey.currentState.validate() == true){
      formKey.currentState.save();

      newUser = new User(00, nome, username, email);
    
      _BuildListViewJsonState.users.add(newUser);

      Navigator.pop(context);

    }

  }
}
