import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vsa_mobile/app/core/const/color.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   String videoUrl = "assets/chao.mp4";
//   //String videoUrl = "https://www.youtube.com/watch?v=IIbxPis0McQ&t=121s";
//   @override
//   void initState() {
//     super.initState();

//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//     _controller = VideoPlayerController.asset(videoUrl);

//     _initializeVideoPlayerFuture = _controller.initialize();
//     _initializeVideoPlayerFuture = _controller.play();
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Complete the code in the next step.
//     return Container(
//       child: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the VideoPlayerController has finished initialization, use
//             // the data it provides to limit the aspect ratio of the video.
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               // Use the VideoPlayer widget to display the video.
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             // If the VideoPlayerController is still initializing, show a
//             // loading spinner.
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class VideoDisplay extends StatefulWidget {
  //const VideoDisplay({Key? key}) : super(key: key);
  final urlPath;
  VideoDisplay({required this.urlPath});
  @override
  State<VideoDisplay> createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  late CachedVideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showFullscreenButton: false);
  late bool isLoading = true;
  //String url = "assets/videos/action/chao.mp4";
  @override
  void initState() {
    super.initState();

    _videoPlayerController = CachedVideoPlayerController.asset(widget.urlPath)
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

  // @override
  // void dispose() {
  //   _customVideoPlayerController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return isLoading == true
    //     ? const Center(
    //         child: CircularProgressIndicator(color: Colors.red),
    //       )
    //     : CustomVideoPlayer(
    return CustomVideoPlayer(
        customVideoPlayerController: _customVideoPlayerController);
  }
}
