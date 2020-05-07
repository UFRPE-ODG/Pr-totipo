import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(4, 2),
  const StaggeredTile.count(4, 2),
  const StaggeredTile.count(4, 2),
  const StaggeredTile.count(4, 2),
];

const TextStyle primaria = const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,);
const TextStyle secundaria = const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,);

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.amber, Icons.dashboard, Text("Dashboard", style: secundaria,)),
  const _Example01Tile(Colors.amber, Icons.person,Text("Perfil", style: secundaria)),
  const _Example01Tile(Colors.amber, Icons.settings, Text("Configurações", style: secundaria)),
  const _Example01Tile(Colors.amber, Icons.map,Text("Heatmap", style: secundaria)),
  const _Example01Tile(Colors.blue, Icons.star,Text("Análise de dados 2020", style: primaria)),
  const _Example01Tile(Colors.blue, Icons.star, Text("Entregar projetos 2019", style: primaria)),
  const _Example01Tile(Colors.blue, Icons.star, Text("Atualizar heatmap", style: primaria)),
  const _Example01Tile(Colors.blue, Icons.star, Text("Recolher dados de 2020", style: primaria)),
];

class Example01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData, this.titulo);

  final Color backgroundColor;
  final IconData iconData;
  final Text titulo;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 100,
                  child: new Icon(
                  iconData,
                  color: Colors.white,
                  size: 50,
                ),)
              ),
              SizedBox(
                height: 50,
                child: titulo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}