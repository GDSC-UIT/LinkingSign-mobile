// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YouTubePlayerScreen extends StatefulWidget {
//   String yUrl;
//   YouTubePlayerScreen({super.key, required this.yUrl});

//   @override
//   State<YouTubePlayerScreen> createState() => _YouTubePlayerScreenState();
// }

// class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
//   YoutubePlayerController? _ycontroller;
//   String? videoId;
//   @override
//   void initState() {
//     super.initState();
//     videoId = YoutubePlayer.convertUrlToId(widget.yUrl);
//     _ycontroller = YoutubePlayerController(
//         initialVideoId: videoId!,
//         flags: YoutubePlayerFlags(autoPlay: true, mute: false));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_unnecessary_containers
//     return Scaffold(
//       body: YoutubePlayer(controller: _ycontroller!),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreen extends StatelessWidget {
  static String myVideoId = 'PQSagzssvUQ';
  // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA
  // it's an interesting video from NASA on Youtube

  // Initiate the Youtube player controller
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  // ignore: use_super_parameters
  YoutubeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
    ));
  }
}
