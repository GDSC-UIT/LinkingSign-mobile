import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/controller/topic_list_controller.dart';
import 'package:vsa_mobile/controller/words_controller.dart';
import 'package:vsa_mobile/database/wordtopic_model.dart';
import 'package:vsa_mobile/widgets/searching_bar.dart';
import 'package:vsa_mobile/widgets/word_card.dart';
import 'package:vsa_mobile/widgets/word_topic_card.dart';

class DictionaryList extends StatefulWidget {
  const DictionaryList({super.key});

  @override
  State<DictionaryList> createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  final dictionaryController = Get.put(WordController());
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return GetX<WordController>(
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchingBar(
                0.9 * screen_width,
                screen_height < horizontalHeight
                    ? 0.2 * screen_height
                    : 0.05 * screen_height,
                "Tìm kiếm từ vựng ở đây",
                WordSearch()),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.words_list.length,
                  itemBuilder: (context, index) {
                    return WordCard(
                        title_field: controller.words_list[index],
                        start_index: index,
                        screen_width: screen_width,
                        screen_height: screen_height,
                        circle_color: const Color.fromARGB(255, 11, 216, 182),
                        number_in_circle_color: Colors.transparent);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
