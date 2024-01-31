import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/controller/topic_words_controller.dart';
import 'package:vsa_mobile/widgets/word_card.dart';

class WordsInTopic extends StatefulWidget {
  // const WordsInTopic({super.key});
  final String topic_name;
  final double screen_width;
  final double screen_height;

  const WordsInTopic(
      {super.key,
      required this.topic_name,
      required this.screen_width,
      required this.screen_height});
  @override
  State<WordsInTopic> createState() => _WordsInTopicState();
}

class _WordsInTopicState extends State<WordsInTopic> {
  final topicsController = Get.put(TopicWordsPairController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic_name,
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
        padding: const EdgeInsets.all(20),
        child: GetX<TopicWordsPairController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.topic_word_pair.length,
              itemBuilder: (BuildContext context, int index) {
                var key = widget.topic_name;
                final titleField =
                    controller.topic_word_pair["$key"]?.elementAt(index);
                return WordCard(
                    title_field: titleField,
                    start_index: index,
                    screen_width: widget.screen_height,
                    screen_height: widget.screen_height,
                    circle_color: ColorClass.circleColor,
                    number_in_circle_color: ColorClass.mainColor);
              },
            );
          },
        ),
      ),
    );
  }
}
