import 'addProjeto.dart';
import 'Dashboard.dart';
import 'package:flutter/material.dart';
import 'Projetos.dart';


List<Projetos> meusProjetos = new List<Projetos>();


class Projeto extends StatelessWidget {
  
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
  var alo = "";
  @override

  Widget build(BuildContext context) {
    lista();
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app,size: 40,), 
        backgroundColor: Colors.orangeAccent ,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProjeto()));
        }
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF0303ff),
      
        title: Text(
          "Projetos",
          style: style.copyWith(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
       
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0303ff),
        currentIndex: 2,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border,color: Colors.white,), title: Text("Favoritar", style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline, color: Colors.white), title: Text("Adicionar",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.remove_circle_outline, color: Colors.white), title: Text("Remover",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
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
                  "Projetos atuais",
                  style: style.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 400,
              child: ListView.builder(
                  itemCount: meusProjetos.length,
                  itemBuilder: (context, index) {
                    if(meusProjetos[index].nome!=null){
                      alo = meusProjetos[index].nome;
            }
            return ListTile(title: Text(alo,style: TextStyle(color: Colors.blue,fontSize: 20),textAlign: TextAlign.center,));
          },
        )  ,)
              
            ]
          )
        )
        
      )
      
    );
  }
  
}

menu(BuildContext context){
return Drawer(
    child: ListView(
      padding: EdgeInsets.zero, 
      children: <Widget>[
        Divider(height: 70,),
        ListTile(
          leading: Icon(Icons.find_in_page,color: Colors.blueAccent,),
          title: Text('Filtrar por',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent,)),
           onTap: () {
                Navigator.of(context).pop();
                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Mensagem()));
              }
        ),
        ListTile(
          leading: Icon(Icons.loupe, color: Colors.blueAccent,),
          title: Text('Pesquisar',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent)),
           onTap: () {
                Navigator.of(context).pop();
                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Perfil()));
              }
        ),
        ListTile(
           title: Text('Favoritos',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.blueAccent)),
           leading: Icon(Icons.favorite_border, color: Colors.blueAccent),
              onTap: () {
                Navigator.of(context).pop();
                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Configuracao()));
              }
         
          
        ),

      ],
    ),);


    
}

lista(){

  

  Projetos notas1 = new Projetos();
  Projetos notas2 = new Projetos();
  Projetos notas3 = new Projetos();
  Projetos notas4 = new Projetos();

  notas1.nome = "Desenvolvimento de gráficos";
  notas2.nome = "Análise de Produtividade de 2018";
  notas3.nome = "Análise de Produtividade de 2019";
  notas4.nome = "Recolhimento de dados de 2020";

 notas1.pessoasParticipando = 3;
 notas2.pessoasParticipando = 5;
 notas3.pessoasParticipando = 7;
 notas4.pessoasParticipando = 3;

 notas1.porcentagemFeita = 40;
 notas2.porcentagemFeita = 70;
 notas3.porcentagemFeita = 70;
 notas4.porcentagemFeita = 40;


    meusProjetos.add(notas1);
    meusProjetos.add(notas2);
    meusProjetos.add(notas3);
    meusProjetos.add(notas4);

    meusProjetos.addAll(listaprojetos);

}