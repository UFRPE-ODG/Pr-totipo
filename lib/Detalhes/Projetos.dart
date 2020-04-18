class Projetos{
   String nome;
   String descricao;
   int pessoasParticipando;
   int porcentagemFeita;

  Projetos();
  
  Projetos.construtor(String nome,String descricao,int pessoas, int porc){
    this.nome = nome;
    this.pessoasParticipando = pessoas;
    this.descricao = descricao;
    this.porcentagemFeita = porc;
  }
  
   bool equals(Projetos compare2){
       if(this.nome == compare2.nome){
          if(this.descricao == compare2.descricao){
                return true;
          }
       }
       return false;
  }

  bool mesmoNPessoas(Projetos compare){
    if(this.pessoasParticipando == compare.pessoasParticipando){
      return true;
    }
    return false;
  }

}