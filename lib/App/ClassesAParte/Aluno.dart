

import 'package:flutter/material.dart';

class Aluno{
   String nome;
   int cpf;
   int nota;
   String cidade;

   Aluno();

   Aluno.construtor(String nome, int cpf,int nota,String cidade){
       this.nome = nome;
       this.nota = nota;
       this.cidade = cidade;
       this.cpf = cpf;
   }
  String toString(){
    return this.nome.toString() + " de cpf: " + this.cpf.toString() + " mora na cidade de "+ this.cidade.toString()+ " e tem média "+this.nota.toString();
  }

  String alunoCidade(){
     return this.cidade.toString();
  }

}

