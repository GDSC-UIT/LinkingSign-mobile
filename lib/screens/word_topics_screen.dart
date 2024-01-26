import 'package:flutter/material.dart';
import 'package:vsa_mobile/database/wordtopic.dart';
import 'package:vsa_mobile/widgets/word_topic_card.dart';

class WordTopicScreen extends StatefulWidget {
  const WordTopicScreen({super.key});

  @override
  State<WordTopicScreen> createState() => _WordTopicScreenState();
}

class _WordTopicScreenState extends State<WordTopicScreen> {
  final topic = wordtopicList;
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return ListView.builder(
        itemCount: topic.length,
        itemBuilder: (context, index) {
          return WordTopicCard(
            url_path: topic[index].url_path,
            title: topic[index].title,
            current_completed: topic[index].current_completed,
            width: screen_width,
            height: screen_height * 0.2,
            total_lessons: 100,
          );
        });
  }
}
