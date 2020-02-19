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
  
  var users = new List<User>();

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
      
      body: listaUsuarios()
    );
  }

  listaUsuarios() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple,
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
    return Container(padding: EdgeInsets.all(32.0),
      child: ListTile(
        title: Text(user.email,
          style: TextStyle(fontWeight: FontWeight.w500)
        ),
        subtitle: Text(user.username),
        leading: Icon(Icons.email, color: Colors.purple),
      ),
    );

  }

}




