import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyCamera extends StatefulWidget {
  const MyCamera({super.key});

  @override
  State<MyCamera> createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  int direction = 0;
  bool isCameraReady = false;

  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  void initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraReady = true;
      });
    }).catchError((error) {
      print("Fail to initialize camera");
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraReady) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(cameraController!),
          GestureDetector(
              onTap: () {
                setState(() {
                  direction = direction == 0 ? 1 : 0;
                  initializeCamera();
                });
              },
              child: button(
                  Icons.flip_camera_android_outlined, Alignment.bottomLeft)),
          GestureDetector(
              onTap: () {
                cameraController!.takePicture().then((XFile file) {
                  if (mounted) {
                    if (file != null) {
                      print('picture stores to ${file.path}');
                    }
                  }
                });
              },
              child: button(Icons.camera_alt_outlined, Alignment.bottomCenter))
        ],
      ),
    );
  }
}

//widget for camera button
Widget button(IconData icon, Alignment alignment) {
  return Align(
    alignment: alignment,
    child: Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(2, 2), blurRadius: 20)
          ]),
      child: Icon(icon, color: Colors.black),
    ),
  );
}
