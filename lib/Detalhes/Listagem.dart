import 'package:flutter/material.dart';

import 'Projeto.dart';
import 'Projetos.dart';
import 'addProjeto.dart';
 

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();

  List<String> nomeProj = new List<String>();

  //final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    
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

    for (int i = 0; i<meusProjetos.length; i++){
      nomeProj.add(meusProjetos[i].nome);
    }
    
    items.addAll(nomeProj);

    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(nomeProj);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(nomeProj);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 40,), 
        backgroundColor: Colors.orangeAccent ,

        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddProjeto()));
        },
      ),

      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0303ff),
        title: new Text("Pesquisa"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search, color: Color(0xFF0303ff),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                        fillColor: Color(0xFF0303ff),
                        focusColor: Color(0xFF0303ff),
                        hoverColor: Color(0xFF0303ff),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    color: Colors.blue[200],
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: ListTile(
                      
                        leading: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {},
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            alignment: Alignment.center,
                            child: Icon(Icons.assignment, 
                              color: Colors.black,
                              size: 50.0,
                            )
                          ),
                        ),
                        title: Text('${items[index]}'),
                        dense: false,

                        onTap: () {
                          var pass = new Projetos();

                          for(int i = 0; i<meusProjetos.length;i++){
                            if(meusProjetos[i].nome.contains(items[index])){
                              pass = meusProjetos[i];
                            }
                          }

                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => DetailProject(pass)
                            )
                          );
                        },
                      )
                    ), 
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
