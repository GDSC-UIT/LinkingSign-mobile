import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/widgets/text_button_custom.dart';
import 'package:vsa_mobile/widgets/word_topics_list.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TextButtonCustom(
                title: "Tất cả",
                Function: () {},
                width: screen_width / 3 - 5,
                height: 40,
                buttonColor: ColorClass.mainColor,
                textColor: Colors.black,
              ),
              TextButtonCustom(
                title: "Đang học",
                Function: () {},
                width: screen_width / 3 - 5,
                height: 40,
                buttonColor: Colors.white,
                textColor: Colors.white,
              ),
              TextButtonCustom(
                title: "Hoàn thành",
                Function: () {},
                width: screen_width / 3 - 5,
                height: 40,
                buttonColor: ColorClass.mainColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        const Expanded(child: WordTopicList()),
      ],
    );
  }
}
