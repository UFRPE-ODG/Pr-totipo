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
Aluno carla = Aluno.construtor("Carla",06133,3,"Recife");
Aluno giovani = Aluno.construtor("Giovani",0223,2,"Recife");
Aluno sebastian = Aluno.construtor("Sebastian",193,5,"Vitória de Santo Antão");
Aluno henrique = Aluno.construtor("Henrique",120,5,"Camaragibe");
Aluno mirela = Aluno.construtor("Mirela",100,6,"Camaragibe");
Aluno caio = Aluno.construtor("caio",1880,2,"Camaragibe");



LatLng pinPosition = LatLng(-8.05428, -34.8813); 
LatLng pinPosition2 = LatLng(-8.1208,-35.0154); 
LatLng pinPosition3 = LatLng(-8.0705, -35.1936);
LatLng pinPosition4 = LatLng(-8.0118, -35.5852); 
LatLng pinPosition5 = LatLng(-8.05442, -35.5410);  

Map<String,LatLng> posicoes = {
  "Recife": pinPosition,
  "Jaboatão": pinPosition2,
  "Vitória": pinPosition3,
  "Camaragibe": pinPosition4,
  "Abreu e Lima": pinPosition5,

};

var posicao;


addMarkers(){
  alunos.add(jorge);
  alunos.add(matheus);
  alunos.add(sebastian);
  alunos.add(henrique);
  alunos.add(bianca);
  alunos.add(luana);

  for(Aluno aluno in alunos){
    if(aluno.cidade == "Abreu e Lima"){
      posicao = pinPosition5;

    }else if(aluno.cidade == "Camaragibe"){
       posicao = pinPosition4;
    }else if(aluno.cidade == "Vitória de Santo Antão"){
       posicao = pinPosition3;
    }else if(aluno.cidade == "Jaboatão"){
       posicao = pinPosition2;
    }else{
       posicao = pinPosition;
    }
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
        markers: _markers,
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
          radius: 20,
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
    marcadores = !marcadores;
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

