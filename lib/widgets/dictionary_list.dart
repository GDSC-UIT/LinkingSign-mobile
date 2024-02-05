import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/controller/words_controller.dart';
import 'package:vsa_mobile/widgets/word_card.dart';

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
        return Container(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.words_list.length,
            itemBuilder: (context, index) {
              return WordCard(
                  title: controller.words_list[index],
                  startIndex: index,
                  screenWidth: screen_width,
                  screenHeight: screen_height,
                  circleColor: const Color.fromARGB(255, 11, 216, 182),
                  number: Colors.transparent);
            },
          ),
        );
      },
    );
  }
}
