import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/controller/topic_list_controller.dart';

import 'package:vsa_mobile/widgets/word_topic_card.dart';

class WordTopicList extends StatefulWidget {
  const WordTopicList({super.key});

  @override
  State<WordTopicList> createState() => _WordTopicListState();
}

class _WordTopicListState extends State<WordTopicList> {
  final topicsController = Get.put(TopicsController());

  final List<String> states = ["Chưa học", "Đang học", "Hoàn thành"];

  late List<String> selectedTopics = [];

  bool selectedState = false;

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return GetX<TopicsController>(
      builder: (controller) {
        var filterTopics = controller.topics.where((topic) {
          //return selectedTopics.isEmpty || selectedTopics.contains(topic.state);
          // if (selectedTopics.contains("Tất cả")) {
          //   return selectedTopics.isNotEmpty;
          // }
          // return selectedTopics.contains(topic.state);
          if (selectedTopics.contains("Chưa học")) {
            return topic.current_completed == 0;
          } else if (selectedTopics.contains("Hoàn thành")) {
            return topic.current_completed == 100;
          } else if (selectedTopics.contains("Đang học")) {
            return topic.current_completed > 0 && topic.current_completed < 100;
          } else
            return selectedTopics.isEmpty;
        }).toList();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: states
                    .map((state) => FilterChip(
                        showCheckmark: false,
                        selectedColor: ColorClass.darkMainColor,
                        label: Text(
                          state,
                          style: TextStyle(
                            color: selectedTopics.contains(state)
                                ? Colors.white
                                : ColorClass.darkMainColor,
                          ),
                        ),
                        selected: selectedTopics.contains(state),
                        onSelected: (value) {
                          setState(() {
                            if (value) {
                              selectedTopics.add(state);
                            } else {
                              selectedTopics.remove(state);
                            }
                          });
                        }))
                    .toList(),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // itemCount: controller.topics.length,
                // itemBuilder: (context, index) {
                //   return WordTopicCard(
                //     url_path: controller.topics[index].url_path,
                //     title: controller.topics[index].title,
                //     current_completed:
                //         controller.topics[index].current_completed,
                //     screen_width: screen_width,
                //     screen_height: screen_height,
                //     total_lessons: controller.topics[index].total_lessons,
                //   );
                // },
                itemCount: filterTopics.length,
                itemBuilder: (context, index) {
                  return WordTopicCard(
                      url_path: filterTopics[index].url_path,
                      title: filterTopics[index].title,
                      current_completed: filterTopics[index].current_completed,
                      screen_width: screen_width,
                      screen_height: screen_height,
                      total_lessons: filterTopics[index].total_lessons);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
