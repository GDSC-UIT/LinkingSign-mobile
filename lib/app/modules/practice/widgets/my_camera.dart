import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart' hide ImageFormat;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart' hide ImageFormat;
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:vsa_mobile/app/core/extension/buildcontext_ex.dart';
import 'package:vsa_mobile/app/data/repositories/media_repository.dart';

// ignore: must_be_immutable
class MyCamera extends StatefulWidget {
  Widget notification;
  MyCamera(
    this.notification,
  );

  @override
  State<MyCamera> createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  int direction = 1;
  bool isCameraReady = false;
  late bool _isRecording = false;

  Timer? countdownTimer;
  late Duration myDuration = const Duration(seconds: 3);
  VideoPlayerController? videoController;

  @override
  void initState() {
    initializeCamera();

    _isRecording = false;
    super.initState();
  }

  void initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraController.initialize().then((_) {
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

  List<String> _thumbnails = [];
  Future<void> _generateThumbnails(XFile file) async {
    var byteData = await VideoThumbnail.thumbnailData(
      video: file.path, // Replace with your video path
      imageFormat: ImageFormat.JPEG,
      quality: 100,
      timeMs: 0,
      maxWidth: 150, // Adjust according to your needs
      maxHeight: 150, // Adjust according to your needs
    );

    List<String> thumbnails = [];
    for (int i = 0; i < 30; i++) {
      Uint8List byteList = byteData!;

      String base64String = base64Encode(byteList);
      thumbnails.add(base64String);

      byteData = await VideoThumbnail.thumbnailData(
        video: file.path, // Replace with your video path
        imageFormat: ImageFormat.JPEG,
        quality: 100,
        timeMs: (i + 1) * 1000, // Extract frames at 1-second intervals
        maxWidth: 150, // Adjust according to your needs
        maxHeight: 150, // Adjust according to your needs
      );
    }

    setState(() {
      _thumbnails = thumbnails;
    });

    print(_thumbnails);
  }

  _recordVideo(context) async {
    if (!_isRecording) {
      await cameraController.initialize();
      await cameraController.prepareForVideoRecording();
      await cameraController.startVideoRecording();
      startTimer();
      setState(() {
        _isRecording = true;
      });
    }
    Future.delayed(Duration(seconds: 3), () async {
      final video_file = await cameraController.stopVideoRecording();

      var repoMedia = MediaRepository();
      var url_link = await repoMedia.uploadVideo(video_file);
      print("STATE IS: ");
      print("GET GET GET GET URLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      print(url_link);
      showDialog(
          context: context,
          builder: (context) {
            return widget.notification;
          });
      setState(() {
        _isRecording = false;
      });
    });
  }

  void startTimer() {
    myDuration = const Duration(seconds: 3);
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;

    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraReady) {
      return const Text("camera close");
    }
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Stack(children: [
      ClipRect(
          child: OverflowBox(
        alignment: Alignment.bottomCenter,
        minWidth: context.screenWidth,
        child: FittedBox(
            fit: BoxFit.fitWidth,
            child: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight *
                    1.5 /
                    cameraController.value.aspectRatio,
                child: CameraPreview(cameraController))),
      )),
      Visibility(
        visible: _isRecording,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            '$seconds s',
            style: const TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () => _recordVideo(context),
          child: Visibility(
            visible: _isRecording ? false : true,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 80,
                ),
                Icon(
                  Icons.circle,
                  color: _isRecording ? Colors.green : Colors.red,
                  size: 65,
                ),
                const Icon(
                  Icons.stop_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
