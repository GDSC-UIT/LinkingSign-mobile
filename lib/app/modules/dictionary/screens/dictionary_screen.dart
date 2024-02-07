import 'package:flutter/material.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';

import 'package:vsa_mobile/app/modules/dictionary/widgets/dictionary_list.dart';
import 'package:vsa_mobile/app/global_widgets/searching_bar.dart';

var demoDictionary = [
  "cong",
  "cha",
  "nhu",
  "nui",
  "thai son",
  "nghia",
  "me",
  "nhu",
  "nuoc",
  "trong",
  "nguon",
  "chay",
  "ra"
];

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        SearchingBar(
            0.9 * screenWidth,
            screenHeight < horizontalHeight
                ? 0.2 * screenHeight
                : 0.05 * screenHeight,
            "Tìm kiếm từ vựng ở đây",
            WordSearch()),
        const SizedBox(height: 10),
        const Expanded(child: DictionaryList()),
      ],
    );
    //return const DictionaryList();
  }
}
