import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDisplay extends StatefulWidget {
  //const VideoDisplay({Key? key}) : super(key: key);
  final urlPath;
  const VideoDisplay({super.key, required this.urlPath});
  @override
  State<VideoDisplay> createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showFullscreenButton: false);
  late bool isLoading = true;
  //String url = "assets/videos/action/chao.mp4";
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.urlPath)
      ..initialize().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
      additionalVideoSources: {
        "720p": _videoPlayerController,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(
            child: CircularProgressIndicator(color: Colors.red),
          )
        : CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController);
  }
}
