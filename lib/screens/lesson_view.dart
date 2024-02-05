import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/database/wordtopic_model.dart';
import 'package:vsa_mobile/widgets/searching_bar.dart';
import 'package:vsa_mobile/widgets/word_topics_list.dart';

// ignore: must_be_immutable
class LessonView extends StatelessWidget {
  // const LessonView({super.key});
  List<WordTopic> filter = [];
  String? query;

  LessonView({super.key});
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchingBar(
            0.9 * screen_width,
            screen_height < horizontalHeight
                ? 0.2 * screen_height
                : 0.05 * screen_height,
            "Tìm kiếm từ vựng ở đây",
            TopicSearch()),
        Expanded(child: WordTopicList())
      ],
    );
  }
}
