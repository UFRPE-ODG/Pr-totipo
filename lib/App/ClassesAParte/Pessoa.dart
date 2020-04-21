class Pessoa{
   String nome;
   String senha;

   Pessoa({this.nome,this.senha});
  Pessoa.construtor(nome,senha){
      this.nome = nome;
      this.senha = senha;
  }
 Pessoa.fromJson(Map json)
      : nome = json['nome'],
        senha = json['senha'];

  Map toJson() {
    return {'nome': nome, 'senha': senha};
  }

  bool equals(Pessoa compare1,Pessoa compare2){
       if(compare1.nome == compare2.nome){
          if(compare1.senha == compare2.senha){
                return true;
          }
       }
       return false;
  }
}
