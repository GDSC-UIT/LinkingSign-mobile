import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';

import 'package:vsa_mobile/app/modules/lessons/topic_list_controller.dart';
import 'package:vsa_mobile/app/modules/lessons/widgets/topic_card.dart';

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
    return GetX<TopicsController>(
      builder: (controller) {
        final filterTopics = controller.topics.where((topic) {
          return selectedTopics.isEmpty || selectedTopics.contains(topic.state);
        }).toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: states
                  .map((state) => FilterChip(
                      showCheckmark: false,
                      selectedColor: ColorClass.darkMainColor,
                      label: Text(
                        state,
                        style: GoogleFonts.poppins(
                            color: selectedTopics.contains(state)
                                ? Colors.white
                                : ColorClass.darkMainColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
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
            const SizedBox(
              height: 10,
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
