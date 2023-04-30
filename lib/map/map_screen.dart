import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../navigation/navigationbar_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required String title}) : super(key: key);

  @override
  State<MapPage> createState() => MapSampleState();
}

class MapSampleState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initalPosition = CameraPosition(
    target: LatLng(33.752098774130076, -84.39182326033728),
    zoom: 14.4746,
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

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
