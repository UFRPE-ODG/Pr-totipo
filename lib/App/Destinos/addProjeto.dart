
import 'Listagem.dart';
import 'package:estudos_flutter/App/ClassesAParte/Projetos.dart';
import 'package:flutter/material.dart';

var projnovo = new Projetos();
var listaprojetos = new List<Projetos>();

String nome;
String des;
int nume;
int porcen;


class AddProjeto extends StatefulWidget {
  @override
  _AddProjetoState createState() => _AddProjetoState();
  
}
class _AddProjetoState extends State<AddProjeto> {
  
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();  
  
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF03050ff),
      
        title: Text(
          "Adicionar Projeto",
          style: style.copyWith(
            color: Colors.white,
            fontSize: 25.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
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
                    "Criar Novo projeto",
                    style: style.copyWith(
                      color: Color(0xFF3050ff),
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

  botaoFazerCadastro(){
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
                    
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    
      child: RaisedButton(
        color: Color(0xFF3050ff),
        child: Text("CRIAR",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),

        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xFF3050ff), width: 2.5),
        ),

        onPressed: () => {
                      
          formkey2.currentState.validate(),
          projnovo.nome = nome,
          projnovo.descricao = des,
          projnovo.pessoasParticipando = nume,
          projnovo.porcentagemFeita = porcen,

          listaprojetos.add(projnovo),

          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => SearchPage())),
          

        },
      ),
    );
  }

}

