import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';

import 'package:vsa_mobile/app/modules/dictionary/widgets/youtube_player_srceen.dart';
import 'package:vsa_mobile/app/global_widgets/example_image.dart';
import 'package:vsa_mobile/app/global_widgets/practice_button.dart';

class LearningScreen extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String word;
  const LearningScreen(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.word});

  // Future<List<WordVideoModel>> readjsonData() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight < horizontalHeight
                ? screenHeight * 0.55
                : screenHeight * 0.3,
            color: Colors.amber,
            child: YoutubeScreen(),
          ),
          Visibility(
            visible: screenHeight < horizontalHeight ? false : true,
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
            visible: screenHeight < horizontalHeight ? false : true,
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
                          exampleImage(screenWidth * 0.4, screenHeight * 0.25,
                              'assets/image_test.jpg', 50),
                          const SizedBox(
                            height: 20,
                          ),
                          exampleImage(screenWidth * 0.4, screenHeight * 0.25,
                              'assets/image_test.jpg', 50),
                        ],
                      ),
                    )),
                visible: screenHeight < horizontalHeight ? false : true),
          ),
          const SizedBox(
            height: 20,
          ),
          practiceButton("Luyện tập", ColorClass.darkMainColor, Colors.white,
              screenWidth, screenHeight, () {}),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
