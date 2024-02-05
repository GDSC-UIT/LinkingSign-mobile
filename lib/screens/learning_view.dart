import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/screens/youtube_player_srceen.dart';
import 'package:vsa_mobile/widgets/example_image.dart';
import 'package:vsa_mobile/widgets/practice_button.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word),
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: screen_width,
              height: screen_height < horizontalHeight
                  ? screen_height * 0.55
                  : screen_height * 0.3,
              color: Colors.amber,
              child: YoutubeScreen(),
            ),
            Visibility(
              visible: screen_height < horizontalHeight ? false : true,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(word,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Visibility(
              visible: screen_height < horizontalHeight ? false : true,
              child: const Text("Hình minh họa bên dưới",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
            ),
            Expanded(
              child: Visibility(
                  // ignore: sort_child_properties_last
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            exampleImage(
                                screen_width * 0.4,
                                screen_height * 0.25,
                                'assets/image_test.jpg',
                                50),
                            const SizedBox(
                              height: 20,
                            ),
                            exampleImage(
                                screen_width * 0.4,
                                screen_height * 0.25,
                                'assets/image_test.jpg',
                                50),
                          ],
                        ),
                      )),
                  visible: screen_height < horizontalHeight ? false : true),
            ),
            const SizedBox(
              height: 20,
            ),
            practiceButton("Luyện tập", ColorClass.darkMainColor, Colors.white,
                screen_width, screen_height, () {}),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
