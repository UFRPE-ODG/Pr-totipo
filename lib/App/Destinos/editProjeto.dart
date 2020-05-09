import 'package:estudos_flutter/App/ClassesAParte/Projetos.dart';
import 'package:estudos_flutter/App/Destinos/Listagem.dart';
import 'package:estudos_flutter/App/Destinos/addProjeto.dart';
import 'package:flutter/material.dart';

class editProjeto extends StatelessWidget {

  final Projetos project;
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();  


  editProjeto(this.project);


  @override
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
                    "Editar Projeto",
                    style: style.copyWith(
                      color: Color(0xFF3050ff),
                      fontSize: 25.0
                    ),
                  ),
                  
                  SizedBox(width: 300.0, child: campoLoginCadastro()),

                  SizedBox(width: 300.0, child:campoNomeCadastro()),
    
                  SizedBox(width: 300.0, child:campoSenhaCadastro()),

                  SizedBox(width: 300.0, child:campoConfirmarSenha()),

                  SizedBox(width: 250.0, child:botaoFazerEdicao()),            

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
        labelText: "Nome do projeto",
                            
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),
                
      validator: (value){
        nome = value;
        if(value.isEmpty){
          return "Informe o Nome";
        }
          return null;
        },
    );
  }

  campoNomeCadastro(){
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Descrição",
                    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),

                      
      validator: (value){
        des = value;
        if(value.isEmpty){
          return "Informe uma descrição do projeto";
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
        labelText: "Nº de participantes",           
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),
               
      validator: (value){
        nume = int.parse(value);
        if(value.isEmpty){
          return "Informe a quantidade de participantes";
        }
          return null;
      },

           
    );
  }
  campoConfirmarSenha(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Porcentagem concluida",
                    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), 
          borderSide: BorderSide(color: Color(0xFF3050ff))
        ),
      ),

      style: style.copyWith(
        color: Colors.black
      ),
               
      validator: (value){
        porcen = int.parse(value);
        if(value.isEmpty){
          return "Informe a porcentagem";
        }
         return null;
      },        
    );
  }

  botaoFazerEdicao(){
    return ButtonTheme(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    
      child: RaisedButton(
        color: Color(0xFF3050ff),

        child: Text("Concluir",
          textAlign: TextAlign.center,
          style: style.copyWith(
          color: Colors.white,
          fontSize: 25.0,
          ),
        ),
                      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),

        onPressed: () => {
                  
          //Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          
        },
      ),
    );
  }

}