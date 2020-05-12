import 'dart:async';
import 'package:estudos_flutter/App/ClassesAParte/Aluno.dart';
import 'package:estudos_flutter/App/Destinos/Configuracao.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
import 'HeatMap.dart';

bool marcadores2 = false; 
var _markers2 = Set<Marker>();
var posicao2;
var alunos2 = List<Aluno>();

addMarkers2(){
  alunos2.add(jorge);
  alunos2.add(matheus);
  alunos2.add(sebastian);
  alunos2.add(henrique);
  alunos2.add(bianca);
  alunos2.add(luana);
  alunos2.add(camila);
  alunos2.add(julia);
  alunos2.add(julio);
  alunos2.add(maria);
  alunos2.add(andre);
  alunos2.add(abner);
  alunos2.add(aline);
  alunos2.add(antony);
  alunos2.add(barbara);
  alunos2.add(catarina);
  alunos2.add(daphne);
  alunos2.add(dulce);
  alunos2.add(eliza);
  alunos2.add(jhon);
  alunos2.add(lidia);
  alunos2.add(marta);
  alunos2.add(carla);
  alunos2.add(giovani);
  alunos2.add(flora);
  alunos2.add(jane);
  alunos2.add(simon);
  alunos2.add(caio);
  alunos2.add(mirela);
  alunos2.add(bernardo);

  for(Aluno aluno in alunos2){
    if(aluno.nota<=3){
      posicoes.forEach((c, v) => (c == aluno.cidade) ? posicao2=v : null);
     _markers2.add(
        Marker(
          markerId: MarkerId(aluno.nome),
          position: posicao2,
          visible: marcadores2,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

        )
    );
   }
     

   
  }
  
}

class MapSample2 extends StatefulWidget {
  @override
  State<MapSample2> createState() => MapSample2State();
}


class MapSample2State extends State<MapSample2> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Heatmap> _heatmaps = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-8.05428, -34.8813),
    zoom: 10.47,
  );

  LatLng _heatmapLocation = LatLng(-8.05428, -34.8813);

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
      appBar: AppBar(
        backgroundColor: Color(0xFF3050ff),
        title:   Text(
          "Alunos com média <= 3",
          style: style.copyWith(
            color: Colors.white,
            fontSize: 25.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addHeatmap,
        label: Text('Add Heatmap'),
        icon: Icon(Icons.add_box),
      ),
    );
    
  }
  void _addHeatmap(){
    setState(() {
      addMarkers2();
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

  heatpormarkers(){
    final List<WeightedLatLng> points2 = <WeightedLatLng>[];
    for(Marker a in _markers2){
      points2.add(_createWeightedLatLng(a.position.latitude, a.position.longitude, 3));
    }
    //marcadores2 = !marcadores2;
    return points2;
  }
  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }
}