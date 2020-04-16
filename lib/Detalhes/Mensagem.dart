import 'package:applogin/Detalhes/Configuracao.dart';
import 'package:flutter/material.dart';
import 'package:applogin/main.dart';
TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

class Mensagem extends StatefulWidget {
  @override
  _MensagemState createState() =>  _MensagemState();
}

class _MensagemState extends State<Mensagem> {
  
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
      appBar: AppBar(
        backgroundColor: Color(0xFF0303ff),
      
        title: Text(
          "Mensagens",
          style: style.copyWith(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),

      ),
      body: Center( 
        child: Container(
          height: 500.0,
          color: Colors.white,
           child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              
              SizedBox(
                child: Text("Nenhuma mensagem recebida",style: style,))
            ]
          )
        )
      )
    )
  );
  
  }
}