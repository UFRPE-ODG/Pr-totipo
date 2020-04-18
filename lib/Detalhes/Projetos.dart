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

class DetailProject extends StatelessWidget {
 
  final Projetos project;
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);

  DetailProject(this.project);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0303ff),
        title: Text(project.nome)
      ), 
      body: projectDetails(),
    );
  }

  projectDetails() {

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 25.0,),

            SizedBox(width:300.00 ,
              child: Text("Descrição: ",
                textDirection: TextDirection.ltr, 
                textAlign: TextAlign.left,
                style: style.copyWith(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 15.0,),

            SizedBox( width: 300.0,
              child: Text("${project.descricao}", 
                textAlign: TextAlign.left,  
                textDirection: TextDirection.ltr,
                style: style.copyWith(
                  fontSize: 19.0
                )
              ),
            ),

            SizedBox(height: 35.0,),

            SizedBox(width:300.00 ,
              child: Text("Participantes: ",
                textDirection: TextDirection.ltr, 
                textAlign: TextAlign.left,
                style: style.copyWith(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 30.0,),

            SizedBox( width: 300.0,
              child: Text("   ${project.pessoasParticipando}", 
                textAlign: TextAlign.left,  
                textDirection: TextDirection.ltr,
                style: style.copyWith(
                  fontSize: 19.0
                )
              ),
            ),

            SizedBox(height: 30.0,),

            SizedBox(width:300.00 ,
              child: Text("Progresso: ",
                textDirection: TextDirection.ltr, 
                textAlign: TextAlign.left,
                style: style.copyWith(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 30.0,),

            SizedBox( width: 300.0,
              child: Text("   ${project.porcentagemFeita}% Concluído.", 
                textAlign: TextAlign.left,  
                textDirection: TextDirection.ltr,
                style: style.copyWith(
                  fontSize: 19.0
                )
              ),
            ),
           
          ],
        ),
      ),
    );
  }

}
