import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoThumbnailPage(),
    );
  }
}

class VideoThumbnailPage extends StatefulWidget {
  @override
  _VideoThumbnailPageState createState() => _VideoThumbnailPageState();
}

class _VideoThumbnailPageState extends State<VideoThumbnailPage> {
  @override
  void initState() {
    super.initState();
    _generateThumbnails();
  }

  List<String> _thumbnails = [];
  Future<void> _generateThumbnails() async {
    var byteData = await VideoThumbnail.thumbnailData(
      video: 'assets/videos/action/chao.mp4', // Replace with your video path
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
        video: 'assets/videos/action/chao.mp4', // Replace with your video path
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Thumbnails'),
      ),
      body: ListView.builder(
        itemCount: _thumbnails.length,
        itemBuilder: (context, index) {
          String thumbnail = _thumbnails[index];
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.memory(
              base64Decode(thumbnail),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
