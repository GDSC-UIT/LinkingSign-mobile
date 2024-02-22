import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/global_widgets/word_card.dart';
import 'package:vsa_mobile/app/modules/word_in_topic/word_in_topic_controller.dart';

class WordsInTopic extends StatefulWidget {
  // const WordsInTopic({super.key});
  final String topicName;

  const WordsInTopic({
    super.key,
    required this.topicName,
  });
  @override
  State<WordsInTopic> createState() => _WordsInTopicState();
}

class _WordsInTopicState extends State<WordsInTopic> {
  final TopicWordsPairController topicsController =
      Get.put(TopicWordsPairController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicName,
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
        child: GetX<TopicWordsPairController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.topic_word_pair[widget.topicName]?.length,
              itemBuilder: (context, index) {
                final key = widget.topicName;
                final titleField =
                    controller.topic_word_pair[key]?.elementAt(index).word;
                final video =
                    controller.topic_word_pair[key]?.elementAt(index).video1url;
                final pic1 =
                    controller.topic_word_pair[key]?.elementAt(index).image1url;
                final pic2 =
                    controller.topic_word_pair[key]?.elementAt(index).image2url;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.topic_word_pair[key]
                          ?.elementAt(index)
                          .isLearned = true;
                    });
                    controller.updateLearningState(
                        titleField, widget.topicName);
                  },
                  child: WordCard(
                      true,
                      titleField,
                      index,
                      ColorClass.circleColor,
                      ColorClass.mainColor,
                      video,
                      pic1,
                      pic2,
                      false),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
