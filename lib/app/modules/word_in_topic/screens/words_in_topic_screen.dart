import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/global_widgets/word_card.dart';
import 'package:vsa_mobile/app/modules/Learning/screens/learning_screen.dart';
import 'package:vsa_mobile/app/modules/word_in_topic/word_in_topic_controller.dart';

class WordsInTopic extends StatefulWidget {
  // const WordsInTopic({super.key});
  final String topic_id;
  final String topic_name;
  WordsInTopic({
    required this.topic_id,
    required this.topic_name,
  });
  @override
  State<WordsInTopic> createState() => _WordsInTopicState();
}

class _WordsInTopicState extends State<WordsInTopic> {
  final WordsInTopicController wordcontroller =
      Get.put(WordsInTopicController());
  @override
  void initState() {
    wordcontroller.getWordByTopicId(widget.topic_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic_name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            )),
        centerTitle: true,
        backgroundColor: ColorClass.myBackground,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        color: ColorClass.myBackground,
        child: GetX<WordsInTopicController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.words.length,
              itemBuilder: (context, index) {
                final titleField = controller.words[index].word;
                final video = controller.words[index].video;
                final pic1 = controller.words[index].example1;
                final pic2 = controller.words[index].example2;
                final word_id = controller.words[index].id;
                return WordCard(true, titleField, index, ColorClass.circleColor,
                    ColorClass.mainColor, video, pic1, pic2, false, word_id);
              },
            );
          },
        ),
      ),
    );
  }
}
