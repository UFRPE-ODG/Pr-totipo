import 'Configuracao.dart';
import 'package:flutter/material.dart';
import 'package:estudos_flutter/main.dart';
import 'Pagina3.dart';

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
        child: Icon(Icons.done_outline,size: 40,), 
        backgroundColor: Colors.orangeAccent ,
        
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Pagina3()));
        }
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF03050ff),
      
        title: Text(
          "Mensagens",
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
