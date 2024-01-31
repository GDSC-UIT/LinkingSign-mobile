import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vsa_mobile/model/video_model.dart';
import 'package:vsa_mobile/screens/youtube_player_srceen.dart';
import 'dart:convert';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningScreen extends StatelessWidget {
  final double screen_width;
  final double screen_height;
  final String word;
  const LearningScreen(
      {super.key,
      required this.screen_width,
      required this.screen_height,
      required this.word});
  // Future<List<WordVideoModel>> readjsonData() async {
  //   final jsonData = await rootBundle.loadString("jsonFile/videolist.json");
  //   final list = json.decode(jsonData) as List<dynamic>;
  //   return list.map((e) => WordVideoModel.fromJson(e)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$word"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: screen_width,
              height: screen_height * 0.3,
              color: Colors.amber,
              child: YoutubeScreen(),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(word,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
            const Text("Hình minh họa bên dưới",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontStyle: FontStyle.italic)),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: screen_width * 0.5,
                          height: screen_height * 0.3,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(40),
                            image: const DecorationImage(
                                image: AssetImage('assets/image_test.jpg'),
                                fit: BoxFit.contain),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: screen_width * 0.5,
                            height: screen_height * 0.3,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  image: AssetImage('assets/image_test.jpg'),
                                  fit: BoxFit.contain),
                            )),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
