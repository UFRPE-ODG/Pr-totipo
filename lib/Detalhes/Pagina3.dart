import 'package:flutter/material.dart';
import 'package:applogin/main.dart';
import 'Configuracao.dart';
import 'Mensagem.dart';
import 'Perfil.dart';
import 'HomePage.dart';

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
     /* bottomNavigationBar: 
      BottomNavigationBar(
        backgroundColor: Color(0xFF0303ff),
        currentIndex: 2,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message,color: Colors.white,), title: Text("Mensagem", style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.white), title: Text("Configurações",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), title: Text("Perfil",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
        ],
      ),*/
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
