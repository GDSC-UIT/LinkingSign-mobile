import 'package:flutter/material.dart';
import 'package:vsa_mobile/screens/learning_view.dart';
import 'package:vsa_mobile/screens/youtube_player_srceen.dart';

class WordCard extends StatelessWidget {
  // const WordCard({super.key});

  final double screen_width;
  final double screen_height;
  final Color circle_color;
  final Color number_in_circle_color;
  final String title_field;
  final int start_index;
  WordCard(
      {required this.title_field,
      required this.start_index,
      required this.screen_width,
      required this.screen_height,
      required this.circle_color,
      required this.number_in_circle_color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen_width,
      height: screen_height * 0.15,
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: circle_color,
          child: Text((start_index + 1).toString(),
              style: TextStyle(fontSize: 20, color: number_in_circle_color)),
        ),
        title: Text("$title_field",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            )),
        trailing: const Icon(Icons.check_circle_outline),
        onTap: () {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (BuildContext builder) {
          //   return const LearningView();
          // }));
          print("tap tap tap tap tap tap tap..........");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => LearningScreen(
                        screen_width: screen_width * 2,
                        screen_height: screen_height,
                        word: title_field,
                      )));
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (builder) => YoutubeScreen()));
        },
      ),
    );
  }
}
