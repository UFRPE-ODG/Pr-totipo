import 'package:flutter/material.dart';
import 'main.dart';
TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
class Configuracao extends StatefulWidget {
  @override
  _ConfiguracaoState createState() =>  _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  
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
          "Configurações",
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
          
          child: Column(
            children: <Widget>[
              
              SizedBox(
                width: 300,
                child: Text(
                  "Som ",
                  style: style.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 300.0, child:som(),  ),
              Divider(),
              SizedBox(
                width: 300,
                child: Text(
                  "Brilho ",
                  style: style.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 300.0, child:brilho()),
              Divider(),
              SizedBox(
                width: 300,
                child: Text(
                  "Notificações",
                  style: style.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 300.0, child:not()),
            ]
          )
        )
        
      )
    );
  }
}
som(){
    return RaisedButton(      
        color: Color(0xFFc8e9ff),
        child: Icon(Icons.volume_down,size: 40,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        onPressed: null,
    );
}
not(){
    return RaisedButton(      
        color: Color(0xFFc8e9ff),
        child: Icon(Icons.notifications_none,size: 40,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        onPressed: null,
    );
}
brilho(){
    return RaisedButton(      
        color: Color(0xFFc8e9ff),
        child: Icon(Icons.brightness_3,size: 40,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        onPressed: null,
    );
}
