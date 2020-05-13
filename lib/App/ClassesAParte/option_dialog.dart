
import 'OptionsDialog.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:estudos_flutter/App/Destinos/Projeto.dart';

class Option {
  final Text title;
  final Icon iconB;
  final Function action;

  
  Option(
    this.title,
    this.iconB,
    this.action,
  );

  static item(Text title, {Icon iconB, Function action}) {
    return Option(title, iconB, action);
  }

  static edit({Text title, Icon iconB, Function action}) {
    return Option(title ?? Text("Edit"), iconB ?? Icon(Icons.edit) , action ?? turna());
  }

  static view({Text title, Icon iconB, Function action}) {
    return Option(
        title ?? Text("View"), iconB ?? Icon(Icons.visibility), action);
  }

  static details({Text title, Icon iconB, Function action}) {
    return Option(title ?? Text("Details"), iconB ?? Icon(Icons.menu), action);
  }
  static nome({Text title, Icon iconB, Function action}) {
    return Option(title ?? Text("Nome"), iconB ?? Icon(Icons.perm_identity), action ?? turnb());
  }
  static descri({Text title, Icon iconB, Function action}) {
    return Option(title ?? Text("Descrição"), iconB ?? Icon(Icons.arrow_drop_down_circle), action);
  }
  static porc({Text title, Icon iconB, Function action}) {
    return Option(title ?? Text("Porcentagem"), iconB ?? Icon(Icons.offline_pin), action);
  }
  static np({Text title, Icon iconB, Function action}) {
    return Option(title ?? Text("Numero de pessoas"), iconB ?? Icon(Icons.people), action);
  }

 
  static delete({Text title, Icon iconB, Function action}) {
    return Option(
        title ??
            Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
        iconB ??
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
        action);
  }
}

 turna(){
    a = true;
 }
 turnb(){
    b = true; 
 }
  /*editar(context){
  
    var editando = List<Option>()
    ..add(Option.nome())
    ..add(Option.descri())
    ..add(Option.np())
    ..add(Option.porc());
   return optionsDialog(context, "Editar", editando);

}*/

ed2(context){
   return singleInputDialog(
    context,
    title: "Editar",
    label: "Nome",
    validator: (value) {
      print("Validator: $value");
      if(value.isEmpty){
         print("erro");
      }
      else{
        return true;
      }
      return false;
    },
    positiveAction: (value) {
      print("Submit: $value");
    },
    negativeAction: () {
      print("negative action");
    },
    neutralAction: () {
      print("neutral action");
    },
  );
}
