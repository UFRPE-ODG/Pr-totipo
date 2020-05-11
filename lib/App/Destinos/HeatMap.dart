import 'dart:async';
import 'package:estudos_flutter/App/ClassesAParte/Aluno.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
bool marcadores = true; 
var _markers = Set<Marker>();

var alunos = List<Aluno>();

Aluno jorge = Aluno.construtor("Jorge",122,6,"Recife");
Aluno matheus = Aluno.construtor("Matheus",123,5,"Abreu e Lima");
Aluno luana = Aluno.construtor("Luana",333,4,"Abreu e Lima");
Aluno bianca = Aluno.construtor("Bianca",06345,5,"Recife");
Aluno bernardo = Aluno.construtor("Bernardo",22063,5,"Recife");
Aluno carla = Aluno.construtor("Carla",06133,5,"Recife");
Aluno giovani = Aluno.construtor("Giovani",0223,6,"Recife");
Aluno sebastian = Aluno.construtor("Sebastian",193,5,"Vitória de Santo Antão");
Aluno henrique = Aluno.construtor("Henrique",120,5,"Camaragibe");
Aluno mirela = Aluno.construtor("Mirela",100,6,"Camaragibe");
Aluno caio = Aluno.construtor("Caio",1880,2,"Camaragibe");
Aluno camila = Aluno.construtor("Camila",1890,2,"Várzea");
Aluno julio = Aluno.construtor("Julio",780,5,"Várzea");
Aluno julia = Aluno.construtor("Julia",483,3,"Várzea");
Aluno maria = Aluno.construtor("Maria",240,6,"Várzea");
Aluno marta = Aluno.construtor("Marta",270,4,"Olinda");
Aluno jhon = Aluno.construtor("john",244,4,"Olinda");
Aluno abner = Aluno.construtor("Abner",840,6,"Curado");
Aluno simon = Aluno.construtor("Simon",3340,5,"Piedade");
Aluno daphne = Aluno.construtor("Daphne",2240,1,"Piedade");
Aluno andre = Aluno.construtor("Andre",4550,1,"Curado");
Aluno antony = Aluno.construtor("Antony",8770,3,"Curado");
Aluno elosie = Aluno.construtor("Eloise",2346663,5,"Recife");
Aluno flora = Aluno.construtor("Flora",299063,2,"Recife");
Aluno aline = Aluno.construtor("Aline",267863,1,"Vitória de Santo Antão");
Aluno catarina = Aluno.construtor("Catarina",2123463,4,"Vitória de Santo Antão");
Aluno dulce = Aluno.construtor("Dulce",27773,4,"Recife");
Aluno barbara = Aluno.construtor("Barbara",2456,4,"Jaboatão");
Aluno jane = Aluno.construtor("Jane",21224,4,"Jaboatão");
Aluno eliza = Aluno.construtor("Eliza",265432,1,"Jaboatão");
Aluno lidia = Aluno.construtor("Lidia",65432,2,"Jaboatão");



LatLng pinPosition = LatLng(-8.05428, -34.8813); 
LatLng pinPosition2 = LatLng(-8.1457003,-35.070392); 
LatLng pinPosition3 = LatLng(-8.1144315,-35.3334958);
LatLng pinPosition4 = LatLng(-7.9812166,-35.0686934); 
LatLng pinPosition5 = LatLng(-8.05442, -35.5410);  
LatLng pinPosition6 = LatLng(-8.0441817,-34.9741592);
LatLng pinPosition7 = LatLng(-8.0793999,-35.0024536);
LatLng pinPosition8 = LatLng(-8.1677225,-34.9420097);
LatLng pinPosition9 = LatLng(-8.1268417,-34.9357666);
LatLng pinPosition10 = LatLng(-7.9964448,-34.9070475);

Map<String,LatLng> posicoes = {
  "Recife": pinPosition,
  "Jaboatão": pinPosition2,
  "Vitória de Santo Antão": pinPosition3,
  "Camaragibe": pinPosition4,
  "Abreu e Lima": pinPosition5,
  "Várzea": pinPosition6,
  "Curado": pinPosition7,
  "Piedade": pinPosition8,
  "Boa viajem": pinPosition9,
  "Olinda": pinPosition10,

};

var posicao;


addMarkers(){
  alunos.add(jorge);
  alunos.add(matheus);
  alunos.add(sebastian);
  alunos.add(henrique);
  alunos.add(bianca);
  alunos.add(luana);
  alunos.add(camila);
  alunos.add(julia);
  alunos.add(julio);
  alunos.add(maria);
  alunos.add(andre);
  alunos.add(abner);
  alunos.add(aline);
  alunos.add(antony);
  alunos.add(barbara);
  alunos.add(catarina);
  alunos.add(daphne);
  alunos.add(dulce);
  alunos.add(eliza);
  alunos.add(jhon);
  alunos.add(lidia);
  alunos.add(marta);
  alunos.add(carla);
  alunos.add(giovani);
  alunos.add(flora);
  alunos.add(jane);
  alunos.add(simon);
  alunos.add(caio);
  alunos.add(mirela);
  alunos.add(bernardo);
  
 

  for(Aluno aluno in alunos){
     posicoes.forEach((c, v) => (c == aluno.cidade) ? posicao=v : null);
    /*if(aluno.cidade == "Abreu e Lima"){
      posicao = pinPosition5;

    }else if(aluno.cidade == "Camaragibe"){
       posicao = pinPosition4;
    }else if(aluno.cidade == "Vitória de Santo Antão"){
       posicao = pinPosition3;
    }else if(aluno.cidade == "Jaboatão"){
       posicao = pinPosition2;
    }else if(aluno.cidade == "Várzea"){
       posicao = pinPosition6;
    }else{
       posicao = pinPosition;
    }*/
    _markers.add(
      Marker(
       markerId: MarkerId(aluno.nome),
       position: posicao,
       visible: marcadores,
       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

      )

    );
  }
  
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}


class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Heatmap> _heatmaps = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-8.05428, -34.8813),
    zoom: 10.47,
  );

  LatLng _heatmapLocation = LatLng(-8.05428, -34.8813);


  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        heatmaps: _heatmaps,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          
        },
        
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),*/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addHeatmap,
        label: Text('Add Heatmap'),
        icon: Icon(Icons.add_box),
      ),
    );
    
  }
  void _addHeatmap(){
    setState(() {
      addMarkers();
      _heatmaps.add(
        Heatmap(
          heatmapId: HeatmapId(_heatmapLocation.toString()),
          points:  heatpormarkers(),
          radius: 40,
          visible: true,
          gradient:  HeatmapGradient(
            colors: <Color>[Colors.green, Colors.red], startPoints: <double>[0.2, 0.8]
          )
        )
      );
    });
  }
  //heatmap generation helper functions
  List<WeightedLatLng> _createPoints(LatLng location) {
    final List<WeightedLatLng> points = <WeightedLatLng>[];
    //Can create multiple points here
    points.add(_createWeightedLatLng(34.62796133580664, -100.685749655962, 2));
    points.add(_createWeightedLatLng(34.52796133580663, -100.985749655962, 3)); 
    points.add(_createWeightedLatLng(34.43796133580654, -100.885749655963, 2)); 
    return points;
  }

  heatpormarkers(){
    final List<WeightedLatLng> points2 = <WeightedLatLng>[];
    for(Marker a in _markers){
      points2.add(_createWeightedLatLng(a.position.latitude, a.position.longitude, 3));
    }
    //marcadores = !marcadores;
    return points2;
  }
  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

