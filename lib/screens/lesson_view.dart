import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/widgets/practice_button.dart';
import 'package:vsa_mobile/widgets/searching_bar.dart';
import 'package:vsa_mobile/widgets/text_button_custom.dart';
import 'package:vsa_mobile/widgets/word_topics_list.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchingBar(
          width: 0.9 * screen_width,
          height: screen_height < horizontalHeight
              ? 0.1 * screen_height
              : 0.05 * screen_height,
          hintText: "Search your topic here",
          filterResult: [],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     // practiceButton("Tất cả", ColorClass.darkMainColor, Colors.white,
        //     //     screen_width * 1.5, screen_height * 1.5, () {}),
        //     PracticeButton("Tất cả", screen_width * 1.5, screen_height * 1.5,
        //         ColorClass.darkMainColor, Colors.white, () {}),

        //     PracticeButton("Đang học", screen_width * 1.5, screen_height * 1.5,
        //         ColorClass.darkMainColor, Colors.white, () {}),
        //     practiceButton("Hoàn thành", ColorClass.darkMainColor, Colors.white,
        //         screen_width * 1.5, screen_height * 1.5, () {}),
        //   ],
        // ),
        const Expanded(child: WordTopicList()),
        // const WordTopicList(),
      ],
    );
  }
}
