import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/controller/topic_list_controller.dart';
import 'package:vsa_mobile/database/wordtopic_model.dart';
import 'package:vsa_mobile/widgets/searching_bar.dart';

import 'package:vsa_mobile/widgets/word_topic_card.dart';

class WordTopicList extends StatefulWidget {
  List filterTopics = [].obs;
  String? queryText;
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

    late TextEditingController query = TextEditingController();
    @override
    void initState() {
      query = TextEditingController();
      super.initState();
    }

    @override
    void dispose() {
      query.clear();
      super.dispose();
    }

    return GetX<TopicsController>(
      builder: (controller) {
        widget.filterTopics = controller.topics.where((topic) {
          return selectedTopics.isEmpty || selectedTopics.contains(topic.state);
        }).toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchingBar(
                0.9 * screen_width,
                screen_height < horizontalHeight
                    ? 0.1 * screen_height
                    : 0.05 * screen_height,
                "Nhấn vào kính để tìm chủ đề",
                TopicSearch()),
            /* Container(
              width: 0.9 * screen_width,
              height: screen_height < horizontalHeight
                  ? 0.1 * screen_height
                  : 0.05 * screen_height,
              // padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: query,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search your topics here",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // setState(() {
                  //   widget.filterTopics =
                  //       controller.filterSearchingBar(query.text);
                  // });
                },
              ),
            ), */
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
                itemCount: widget.filterTopics.length,
                itemBuilder: (context, index) {
                  return WordTopicCard(
                      url_path: widget.filterTopics[index].url_path,
                      title: widget.filterTopics[index].title,
                      current_completed:
                          widget.filterTopics[index].current_completed,
                      screen_width: screen_width,
                      screen_height: screen_height,
                      total_lessons: widget.filterTopics[index].total_lessons);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
