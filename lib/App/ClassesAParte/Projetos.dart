import 'package:estudos_flutter/App/Destinos/editProjeto.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
class Projetos{
   String nome;
   String descricao;
   int pessoasParticipando;
   int porcentagemFeita;

  Projetos();
  
  Projetos.construtor(String nome,String descricao,int pessoas, int porc){
    this.nome = nome;
    this.pessoasParticipando = pessoas;
    this.descricao = descricao;
    this.porcentagemFeita = porc;
  }
  
   bool equals(Projetos compare2){
       if(this.nome == compare2.nome){
          if(this.descricao == compare2.descricao){
                return true;
          }
       }
       return false;
  }

  bool mesmoNPessoas(Projetos compare){
    if(this.pessoasParticipando == compare.pessoasParticipando){
      return true;
    }
    return false;
  }

}

class DetailProject extends StatelessWidget {
 
  final Projetos project;
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

  DetailProject(this.project);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF3050ff),
        title: Text(project.nome, 
          style: style.copyWith(
            color: Colors.white,
          ),
        )
      ), 
      body: Builder(
        builder: (context) => Center(
          child: projectDetails(),
        ) ,
      ),

      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.amber,
        children: [
          SpeedDialChild(
            child: Icon(Icons.delete),
            backgroundColor: Colors.blue,
            label: "Deletar",
            onTap: () {
              
            },
          ),

          SpeedDialChild(
            child: Icon(Icons.edit),
            backgroundColor: Colors.blue,
            label: "Editar",
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => editProjeto(this.project),
                )
              );
            }
          )
        ],
      ),
    );
  }

  projectDetails() {

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 25.0,),

            SizedBox(width:300.00 ,
              child: Text("Descrição: ",
                textDirection: TextDirection.ltr, 
                textAlign: TextAlign.left,
                style: style.copyWith(
                  fontSize: 25.0,
                  //fontWeight: FontWeight.bold,
                  color: Color(0xFF3050ff)
                ),
              ),
            ),

            SizedBox(height: 10.0,),

            SizedBox( width: 300.0,
              child: Text("${project.descricao}", 
                textAlign: TextAlign.left,  
                textDirection: TextDirection.ltr,
                style: style.copyWith(
                  fontSize: 19.0,
                  color: Colors.black
                )
              ),
            ),

            SizedBox(height: 35.0,),

            SizedBox(width:300.00 ,
              child: Text("Participantes: ",
                textDirection: TextDirection.ltr, 
                textAlign: TextAlign.left,
                style: style.copyWith(
                  fontSize: 25.0,
                  //fontWeight: FontWeight.bold,
                  color: Color(0xFF3050ff)
                ),
              ),
            ),

            SizedBox(height: 10.0,),

            SizedBox( width: 300.0,
              child: Text("${project.pessoasParticipando}", 
                textAlign: TextAlign.left,  
                textDirection: TextDirection.ltr,
                style: style.copyWith(
                  fontSize: 19.0,
                  color: Colors.black
                )
              ),
            ),

            SizedBox(height: 30.0,),

            SizedBox(width:300.00 ,
              child: Text("Progresso: ",
                textDirection: TextDirection.ltr, 
                textAlign: TextAlign.left,
                style: style.copyWith(
                  fontSize: 25.0,
                  //fontWeight: FontWeight.bold,
                  color: Color(0xFF3050ff)
                ),
              ),
            ),

            SizedBox(height: 10.0,),

            SizedBox( width: 300.0,
              child: Text("${project.porcentagemFeita}% Concluído.", 
                textAlign: TextAlign.left,  
                textDirection: TextDirection.ltr,
                style: style.copyWith(
                  fontSize: 19.0,
                  color: Colors.black
                )
              ),
            ),

            SizedBox(height: 100,),

           /* Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                
                botaoEditar(this.project),
              
                botaoDeletar(),

              ],
            )*/
           
          ],
        ),
      ),
    );
  }

  botaoDeletar(){
    return IconButton(
      icon: Icon(Icons.delete,
        color: Color(0xFF3050ff),
        size: 40.0,
      ), 
      onPressed: () {

      }
    );
  }

  botaoEditar(Projetos project){
    return IconButton(
      icon: Icon(Icons.edit,
        color: Color(0xFF3050ff),
        size: 40.0,
      ), 
      onPressed: () {

      }
    );
      
  }

}
