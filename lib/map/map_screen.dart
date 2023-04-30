import 'package:flutter/material.dart';

import '../navigation/navigationbar_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});
  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavigationAppBar(title: "Map"),
      drawer: NavigationMenu(),
    );
  }
}
