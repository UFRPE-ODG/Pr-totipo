import 'dart:convert';
import 'package:flutter/material.dart';
import 'API.dart';
import 'Pessoa.dart';
import 'HomePage.dart';
import 'Login.dart';

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
