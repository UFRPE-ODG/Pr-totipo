import 'package:applogin/Configuracao.dart';
import 'package:flutter/material.dart';
import 'main.dart';

TextStyle sty = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0, color: Colors.blueAccent);

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save,size: 40,), 
        backgroundColor: Colors.orangeAccent ,
        
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Pagina3()));
        }
      ),
      body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
         UserAccountsDrawerHeader(
          accountName: Text("João Pedro",style: style,),
           accountEmail: Text("JoaoPedro@gmail.com",style: style,),
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
              leading: Icon(Icons.image),
              title: Text("Mudar foto de perfil",style: sty, ),
           ),
           Divider(),
           ListTile(
              leading: Icon(Icons.person),
              title: Text("Mudar login",style: sty),
           ),
           Divider(),
           ListTile(
              leading: Icon(Icons.import_export),
              title: Text("Mudar senha",style: sty),
           ),
           Divider(),
           ListTile(
              leading: Icon(Icons.delete),
              title: Text("Apagar conta",style: sty,),
           ),
           Divider(),
           ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Criar nova conta",style: sty),
              onTap:() {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Login()));
              }
              ,
           )
      ])

    );
    
  }
}

