
import 'package:flutter/material.dart';

buildListDinamicV(){
//Lista vertical
  final itens = List<String>.generate(10000, (i) => "Item $i");

  return ListView.builder(
    itemCount: itens.length,
    itemBuilder: (context, index){
      return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("${itens[index]}"),
        onTap: () {
          debugPrint("${itens[index]} foi selecionado");
        } ,
      );
    }
  );
}
 

buildListDinamicH(){
//Lista Horizontal
  final itens = List<String>.generate(10000, (i) => "Item $i");

  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        color: Colors.lime,
        child: Text("$index"),
      );
    }
  );
}
