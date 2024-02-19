import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/modules/dictionary/dictionary_controller.dart';
import 'package:vsa_mobile/app/global_widgets/word_card.dart';

class DictionaryList extends StatefulWidget {
  const DictionaryList({super.key});

  @override
  State<DictionaryList> createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  final dictionaryController = Get.put(WordController());
  @override
  Widget build(BuildContext context) {
    return GetX<WordController>(
      builder: (controller) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.wordsList.length,
          itemBuilder: (context, index) {
            return WordCard(
                false,
                controller.wordsList.elementAt(index).word,
                index,
                const Color.fromARGB(255, 11, 216, 182),
                Colors.transparent,
                controller.wordsList.elementAt(index).video1url,
                controller.wordsList.elementAt(index).image1url,
                controller.wordsList.elementAt(index).image2url,
                controller.wordsList.elementAt(index).isLearned);
          },
        );
      },
    );
  }
}
