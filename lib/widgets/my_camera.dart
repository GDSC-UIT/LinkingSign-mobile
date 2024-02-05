import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyCamera extends StatefulWidget {
  const MyCamera(
      {super.key, required this.screen_width, required this.screen_height});
  final double screen_width;
  final double screen_height;
  @override
  State<MyCamera> createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  int direction = 1;
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
    return Stack(
      children: [
        ClipRect(
            child: OverflowBox(
          alignment: Alignment.bottomCenter,
          child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                  width: widget.screen_width,
                  height: widget.screen_height *
                      1.15 /
                      cameraController!.value.aspectRatio,
                  child: AspectRatio(
                    aspectRatio: cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!),
                  ))),
        )),
        // GestureDetector(
        //     onTap: () {
        //       setState(() {
        //         direction = direction == 0 ? 1 : 0;
        //         initializeCamera();
        //       });
        //     },
        //     child: button(
        //         Icons.flip_camera_android_outlined, Alignment.bottomCenter)),
        // GestureDetector(
        //     onTap: () {
        //       cameraController!.takePicture().then((XFile file) {
        //         if (mounted) {
        //           if (file != null) {
        //             print('picture stores to ${file.path}');
        //           }
        //         }
        //       });
        //     },
        //     child: button(Icons.camera_alt_outlined, Alignment.bottomRight))
      ],
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
      // margin: const EdgeInsets.only(left: 20, right: 20),
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
