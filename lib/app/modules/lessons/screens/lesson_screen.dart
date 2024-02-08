import 'package:flutter/material.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/global_widgets/searching_bar.dart';
import 'package:vsa_mobile/app/modules/lessons/widgets/topics_list.dart';

// ignore: must_be_immutable
class LessonView extends StatelessWidget {
  // const LessonView({super.key});
  List<WordTopic> filter = [];
  String? query;

  LessonView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchingBar(
            0.9 * screenWidth,
            screenHeight < horizontalHeight
                ? 0.2 * screenHeight
                : 0.05 * screenHeight,
            "Tìm kiếm chủ đề",
            TopicSearch()),
        Expanded(child: WordTopicList())
      ],
    );
  }
}
