import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../navigation/navigationbar_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required String title}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initalPosition = CameraPosition(
    target: LatLng(33.752098774130076, -84.39182326033728),
    zoom: 11.4746,
  );

  static const Marker _gaAquariumMarker = Marker(
      markerId: MarkerId('_gaAquariumMarker'),
      infoWindow: InfoWindow(title: 'Georgia Aquarium'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(33.763501097617166, -84.39459827012271));

  static const Marker _gaCocaColaMarker = Marker(
      markerId: MarkerId('_gaCocaColaMarker'),
      infoWindow: InfoWindow(title: 'World of Coca-Cola'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(33.76267718733346, -84.39160558829732));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavigationAppBar(title: "Meal Plan"),
      drawer: const NavigationMenu(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: {_gaAquariumMarker, _gaCocaColaMarker},
        initialCameraPosition: _initalPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
