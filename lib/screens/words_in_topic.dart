import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/controller/topic_words_controller.dart';

class WordsInTopic extends StatefulWidget {
  // const WordsInTopic({super.key});
  final String topic_name;
  final double height;
  final double width;

  const WordsInTopic(
      {super.key,
      required this.topic_name,
      required this.height,
      required this.width});
  @override
  State<WordsInTopic> createState() => _WordsInTopicState();
}

class _WordsInTopicState extends State<WordsInTopic> {
  final topicsController = Get.put(TopicWordsPairController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic_name,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: ColorClass.myBackground,
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
                return Container(
                  width: widget.width,
                  height: widget.height,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 217, 240, 237),
                      child: Text((index + 1).toString(),
                          style: const TextStyle(color: ColorClass.mainColor)),
                    ),
                    title: Text("$titleField"),
                    trailing: const Icon(Icons.check_circle_outline),
                    onTap: () {
                      print("Tap Tap the listile");
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
  // child: ListTile(
  //                 leading: CircleAvatar(
  //                   backgroundColor: Colors.white,
  //                   child: Text((index + 1).toString(),
  //                       style: const TextStyle(color: ColorClass.mainColor)),
  //                 ),
  //                 title: const Text("Title content"),
  //                 trailing: Icon(Icons.play_circle_fill),
  //               ),