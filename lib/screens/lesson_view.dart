import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vsa_mobile/const/color.dart';
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
          height: 0.2 * screen_height,
          hintText: "Search your topic here",
        ),

        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       TextButtonCustom(
        //         title: "Tất cả",
        //         Function: () {},
        //         width: screen_width / 3 - 5,
        //         height: 40,
        //         buttonColor: ColorClass.mainColor,
        //         textColor: Colors.black,
        //       ),
        //       TextButtonCustom(
        //         title: "Đang học",
        //         Function: () {},
        //         width: screen_width / 3 - 5,
        //         height: 40,
        //         buttonColor: Colors.white,
        //         textColor: Colors.white,
        //       ),
        //       TextButtonCustom(
        //         title: "Hoàn thành",
        //         Function: () {},
        //         width: screen_width / 3 - 5,
        //         height: 40,
        //         buttonColor: ColorClass.mainColor,
        //         textColor: Colors.white,
        //       ),
        //     ],
        //   ),
        // ),
        const Expanded(child: WordTopicList()),
      ],
    );
  }
}
