import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vsa_mobile/app/core/const/color.dart';

import 'package:vsa_mobile/app/modules/dictionary/topic_words_controller.dart';
import 'package:vsa_mobile/app/global_widgets/word_card.dart';

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
  final topicsController = Get.put(TopicWordsPairController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w900,
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
              itemCount: controller.topic_word_pair.length,
              itemBuilder: (BuildContext context, int index) {
                var key = widget.topicName;
                final titleField =
                    controller.topic_word_pair[key]?.elementAt(index);
                return WordCard(
                    circleVisible: true,
                    title: titleField,
                    startIndex: index,
                    circleColor: ColorClass.circleColor,
                    number: ColorClass.mainColor);
              },
            );
          },
        ),
      ),
    );
  }
}
