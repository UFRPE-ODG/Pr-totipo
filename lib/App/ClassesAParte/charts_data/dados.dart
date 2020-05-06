import 'package:charts_flutter/flutter.dart' as charts;
import 'package:estudos_flutter/App/ClassesAParte/charts_data/processos.dart';


import 'alunosAprovados.dart';
import 'alunosNota.dart';
import 'alunosPesquisados.dart';


List<charts.Series<AlunosPesquisados, String>> dadosAlunosPesquisados() {
  final dados = [
    new AlunosPesquisados(500, 'Mar'),
    new AlunosPesquisados(1200, 'Abr'),
    new AlunosPesquisados(1600, 'Mai'),
    new AlunosPesquisados(2300, 'Jun')
  ];

  return [
    new charts.Series<AlunosPesquisados, String>(
      id: 'Alunos de Celular',
      data: dados,
      measureFn: (AlunosPesquisados alu, _) =>
      alu.quantidade, //Definindo qual atributo vai ser medido
      domainFn: (AlunosPesquisados alu, _) =>
      alu.mes, //Definindo qual atributo vai ser o domínio
    )
  ];
}

List<charts.Series<AlunosNota, String>> dadosAlunosNotas() {
  final dados = [
    new AlunosNota(600, '≤3'),
    new AlunosNota(1600, '>3 e ­­≤5'),
    new AlunosNota(1400, '>5 e ≤7'),
    new AlunosNota(2000, '>7')
  ];

  return [
    new charts.Series<AlunosNota, String>(
      id: 'Alunos',
      data: dados,
      domainFn: (AlunosNota alu, _) => alu.nota,
      measureFn: (AlunosNota alu, _) => alu.quantidade,
      labelAccessorFn: (AlunosNota alu, _) => '${alu.quantidade}',
    ),
  ];
}

List<charts.Series<Processos, String>> dadosProcessos() {
  final dados = [
    new Processos(100, 'Adm.'),
    new Processos(250, 'Acad.'),
    new Processos(60, 'Ext.'),
    new Processos(50, 'Inc.'),
  ];

  return [
    new charts.Series<Processos, String>(
      id: 'Processos',
      data: dados,
      measureFn: (Processos processo, _) =>
      processo.quantidade, //Definindo qual atributo vai ser medido
      domainFn: (Processos processo, _) =>
      processo.tipo, //Definindo qual atributo vai ser o domínio
    )
  ];
}

List<charts.Series<AlunosAprovados, double>> dadosAlunosAprovados() {
  final dados = [
    new AlunosAprovados(2800, 2018.1),
    new AlunosAprovados(1500, 2018.6),
    new AlunosAprovados(3400, 2019.1),
    new AlunosAprovados(2500, 2019.6),
  ];

  return [
    new charts.Series<AlunosAprovados, double>(
      id: 'Processos',
      data: dados,
      measureFn: (AlunosAprovados alu, _) =>
      alu.quantidade, //Definindo qual atributo vai ser medido
      domainFn: (AlunosAprovados alu, _) =>
      alu.semestre, //Definindo qual atributo vai ser o domínio
    )
  ];
}