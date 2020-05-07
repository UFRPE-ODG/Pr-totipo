import 'MenuHeatmaps.dart';
import 'package:flutter/material.dart';
import 'Configuracao.dart';
import 'Mensagem.dart';
import 'Perfil.dart';
import 'HomePage.dart';
import 'charts_screens/dashboardPage.dart';
import 'package:estudos_flutter/App/ClassesAParte/Cartoes.dart';

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
        backgroundColor: Color(0xFF3050ff),
      
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
      drawer: menu(context), 
      body: Example01(),
    );
  }
}
/*
  child: Container(
          height: 600.0,
          color: Colors.white,
          
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: 
                 Row(
                  children: <Widget>[
                   SizedBox(
                     width: 200,
                      height: 200,
                      child: Card(
                        elevation: 0,
                        color: Color(0xFFffa92b),
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                              child: Icon(Icons.dashboard,size: 40,),
                              
                            ),
                            Text("Dashboard", style: style.copyWith(
                              color: Colors.white,
                              fontSize: 30.0,
                             ),
                            ),
                          ],
                        ),
                        clipBehavior: null,
                        
                      ),

                    ),
                     SizedBox(
                      width: 190,
                      height: 200,
                      child: Card(
                        elevation: 0,
                        color: Color(0xFFffa92b),
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                              child: Icon(Icons.map,size: 40,),
                            ),
                            Text('Heatmap',
                              style: style.copyWith(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),),
                          ],
                        ),
                        clipBehavior: null,
                        
                      ),

                    ),
                    
                  
                ],
              ),
              ),
              SizedBox(
                height: 200,
                child: Card(
                   elevation: 0,
                    color: Color(0xFF3003ff),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                              height: 100,
                              child: Icon(Icons.star,color: Colors.yellowAccent,size: 40,),
                            ),
                          ListTile(
                          title: Text('Entregar projeto de 2020',
                            style: style.copyWith(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),),
                          dense: false,

                          onTap: () {
                            
                          },
                        ),
                      
                    ],
                    ) 
                ),
              ),
              SizedBox(
                height: 200,
                child: Card(
                   elevation: 0,
                    color: Color(0xFF3003ff),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                              height: 100,
                              child: Icon(Icons.star,color: Colors.yellowAccent,size: 40,),
                            ),
                          ListTile(
                          title: Text('Análise de dados 2020',
                            style: style.copyWith(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: "Glacial Indifference"
                          ),),
                          dense: false,

                          onTap: () {
                            
                          },
                        ),
                      
                    ],
                    ) 
                ),
              ),
              
            ]
          )
        )
        
*/

var imagemdefundo = "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg";
var fotodeperfil = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

menu(BuildContext context){
TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
return Drawer(
    child: ListView(
      padding: EdgeInsets.zero, 
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("João Pedro",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
           accountEmail: Text("JoaoPedro@gmail.com",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
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
          leading: Icon(Icons.grain,color: Color(0xFF3050ff),),
          title: Text('Dashboard',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
           onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => DashboardPage()));
              }
        ), 
        ListTile(
          leading: Icon(Icons.map,color: Color(0xFF3050ff),),
          title: Text('HeatMaps',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
           onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => MenuHeat()));
              }
        ),
        ListTile(
          leading: Icon(Icons.message,color: Color(0xFF3050ff),),
          title: Text('Messages',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
           onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Mensagem()));
              }
        ),
        ListTile(
          leading: Icon(Icons.account_circle, color: Color(0xFF3050ff),),
          title: Text('Perfil',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff))),
           onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Perfil()));
              }
        ),
        ListTile(
           title: Text('Configurações',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff))),
           leading: Icon(Icons.settings, color: Color(0xFF3050ff)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Configuracao()));
              }
         
          
        ),

      ],
    ),);
}
