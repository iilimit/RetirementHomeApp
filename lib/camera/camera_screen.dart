import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../navigation/navigationbar_widget.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required String title}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
          appBar: const NavigationAppBar(title: "Meal Plan"),
          drawer: const NavigationMenu(),
          body: Stack(
            children: [CameraPreview(cameraController)],
          ));
    } else {
      return const SizedBox();
    }
  }
}
