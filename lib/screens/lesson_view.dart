import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/widgets/text_button_custom.dart';
import 'package:vsa_mobile/widgets/word_topics_list.dart';

var topicsdata = ["Đồ ăn", "Thức uống", "nước chanh"];

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screen_width * 0.9,
          height: screen_height * 0.08,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Search topics...",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
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
