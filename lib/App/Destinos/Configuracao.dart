import 'package:flutter/material.dart';
import 'package:estudos_flutter/main.dart';
import 'package:estudos_flutter/App/ClassesAParte/Botao.dart';
import 'Pagina3.dart';

TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

class Configuracao extends StatefulWidget {
  @override
  _ConfiguracaoState createState() =>  _ConfiguracaoState();
}
 bool enableCoolStuff = false;
 bool enableCoolStuff2 = false;
 bool enableCoolStuff3 = false;

class _ConfiguracaoState extends State<Configuracao> {
  
  @override
  Widget build(BuildContext context) {
    @override
    void _toggle() {
    setState(() {
      enableCoolStuff = !enableCoolStuff;
    });}
    void _toggle2() {
    setState(() {
      enableCoolStuff2 = !enableCoolStuff2;
    });}
    void _toggle3() {
    setState(() {
      enableCoolStuff3 = !enableCoolStuff3;
    });
  }
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
        backgroundColor: Color(0xFF3050ff),
      
        title: Text(
          "Configurações",
          style: style.copyWith(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),

      ),
      body: Center( 
        child: Container(
          height: 500.0,
          color: Colors.white,
          
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.mic,color: Color(0xFF3050ff),),
                title: Text('Som',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
                trailing: GestureDetector(
                onTap: _toggle2,
                behavior: HitTestBehavior.translucent,
                child: 
                  Botao(checked: enableCoolStuff2),
                  
                
              ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications_none,color: Color(0xFF3050ff),),
                title: Text('Notificação',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
                trailing: GestureDetector(
                onTap: _toggle3,
                behavior: HitTestBehavior.translucent,
                child: 
                  Botao(checked: enableCoolStuff3),
                  
                
              ),
              ),
              Divider(),
            
              ListTile(
                
                leading: Icon(Icons.lightbulb_outline,color: Color(0xFF3050ff),),
                title: Text('Brilho',style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Color(0xFF3050ff),)),
                trailing: GestureDetector(
                onTap: _toggle,
                behavior: HitTestBehavior.translucent,
                child: 
                  Botao(checked: enableCoolStuff),
                  
                
              ),
              ),

              Divider(),
              
            ]
          )
        )
        
      )
    );
  }
    }
