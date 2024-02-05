import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/controller/topic_list_controller.dart';
import 'package:vsa_mobile/widgets/word_topic_card.dart';

class WordTopicList extends StatefulWidget {
  WordTopicList();
  @override
  State<WordTopicList> createState() => _WordTopicListState();
}

final List<String> states = ["Chưa học", "Đang học", "Hoàn thành"];

List<String> selectedTopics = [];

class _WordTopicListState extends State<WordTopicList> {
  final topicsController = Get.put(TopicsController());

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return GetX<TopicsController>(
      builder: (controller) {
        final filterTopics = controller.topics.where((topic) {
          return selectedTopics.isEmpty || selectedTopics.contains(topic.state);
        }).toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                itemCount: filterTopics.length,
                itemBuilder: (context, index) {
                  return WordTopicCard(
                      urlPath: filterTopics[index].url_path,
                      title: filterTopics[index].title,
                      currentCompleted: filterTopics[index].current_completed,
                      screenWidth: screen_width,
                      screenHeight: screen_height,
                      totalLessons: filterTopics[index].total_lessons);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
