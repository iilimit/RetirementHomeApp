import 'dart:async';
import 'dart:io';

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
      throw (e);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
          appBar: const NavigationAppBar(title: "Meal Plan"),
          drawer: const NavigationMenu(),
          body: Stack(
            children: [
              CameraPreview(cameraController),
              FloatingActionButton(
                onPressed: () async {
                  final image = await cameraController.takePicture();
                  // ignore: use_build_context_synchronously
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DisplayPictureScreen(imagePath: image.path)));
                },
                child: const Icon(Icons.camera_alt),
              )
            ],
          ));
    } else {
      return const SizedBox();
    }
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Displaying the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
