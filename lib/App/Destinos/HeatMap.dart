import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
bool marcadores = true; 
var _markers = Set<Marker>();
LatLng pinPosition = LatLng(34.42796133580664, -100.985749655962); 
LatLng pinPosition2 = LatLng(34.52796133580664, -100.995749655962); 
LatLng pinPosition3 = LatLng(34.62796133580664, -101.085749655962);
LatLng pinPosition4 = LatLng(34.82796133580664, -100.685749655962); 
LatLng pinPosition5 = LatLng(34.34796133580664, -100.085749655962);  
addMarkers(){
  _markers.add(
     Marker(
      markerId: MarkerId('aluno'),
      position: pinPosition,
      visible: marcadores,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

    )
  );
  _markers.add(
     Marker(
      markerId: MarkerId('aluno2'),
      position: pinPosition2,
      visible: marcadores,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

    )
  );
  _markers.add(
     Marker(
      markerId: MarkerId('aluno3'),
      position: pinPosition3,
      visible: marcadores,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

    )
  );
  _markers.add(
     Marker(
      markerId: MarkerId('aluno4'),
      position: pinPosition4,
      visible: marcadores,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

    )
  );
  _markers.add(
     Marker(
      markerId: MarkerId('aluno5'),
      position: pinPosition5,
      visible: marcadores,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

    )
  );
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}


class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Heatmap> _heatmaps = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.42796133580664, -100.985749655962),
    zoom: 10.47,
  );

  LatLng _heatmapLocation = LatLng(37.42796133580664, -122.085749655962);


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

