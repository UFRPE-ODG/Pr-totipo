import 'Projeto.dart';
import 'Configuracao.dart';
import 'package:flutter/material.dart';
import 'Pagina3.dart';
import 'Listagem.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
 
class _DashboardState extends State<Dashboard> {
  bool edit;
void initState() {
    // TODO: implement initState
    super.initState();
    edit = false;
}
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
        backgroundColor: Color(0xFF3050ff),
      
        title: Text(
          "Dashboard",
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
              children: <Widget>[
              
              SizedBox(
                child: Text("   Analise melhor os gráficos selecionando o botão ao seu lado",style: new TextStyle(color: Color(0xFF3050ff), fontSize: 20,fontFamily: "Glacial Indifference", ) ,)),
              SizedBox(
                height: 300,
                 child: Row(
                   children: <Widget>[
                     SizedBox(height: 200,child: Image.asset("imagens/5C.JPG", fit: BoxFit.scaleDown)),
                     IconButton(icon: Icon(Icons.add_circle_outline,color: Color(0xFF3050ff),), onPressed: (){
                      alert(context);
                     }
                      
                     ),
                    
                   ]
                 ),
              ),
              SizedBox(
                height: 20,
                 child: Row(
                   children: <Widget>[
                      Text(" Projetos   ",style:new TextStyle(color: Color(0xFF3050ff), fontSize: 20,fontFamily: "Glacial Indifference", ),),
                      IconButton(icon: Icon(Icons.list), onPressed:() {Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => SearchPage()));},iconSize: 30,color: Colors.blueAccent,),
                   ]
                 ),
                 
              ),
              Divider(height: 60,),
            ]
          )
        )
      )
    )
    );
  }
}

/*info(){
   return BottomNavigationBar(
        backgroundColor: Color(0xFF0303ff),
        currentIndex: 2,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message,color: Colors.white,), title: Text("Mensagem", style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.white), title: Text("Configurações",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), title: Text("Perfil",style: TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0,color: Colors.white),),),
        ],
   );
}*/

graf(){
  return BottomAppBar(
      color: Color(0xFF3050ff),
      child: 
      Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.insert_chart), onPressed: null),
          IconButton(icon: Icon(Icons.info), onPressed: null),
          IconButton(icon: Icon(Icons.perm_data_setting), onPressed: null)
        ]
      ),
    );
}

alert(context){
   print("Alo");
   return showDialog<void>(
     context: context,
     child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30 * 0.050)),
        backgroundColor: Colors.blueAccent,
        contentTextStyle: style,
        title: Text(
          "Informações",
            textAlign: TextAlign.center,
            style: style,
          ),
        content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: Column(
                          
                          children: <Widget>[
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  
                                  Text(" Esse gráfico foi feito", style: style,),
                                  Text(" de acordo com os dados",style: style),
                                  Text(" informados abaixo",style: style),
                                  Text(" 30 40 50 60",style: style),
                                  SizedBox(child:  IconButton(
                                  icon: Icon(Icons.done_all),
                                  color: Colors.white,
                                  iconSize: 40,
                                  onPressed:(){
                                    Navigator.of(context).pop();
                                  } 
                                  ),) 
                                ],
                              ),

                            ),
                          ],
                        ),),
                         
                    ]
                  ),
                ],
              ),
        ),
      )
   );
}
