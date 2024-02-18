import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/global_widgets/searching_bar.dart';
import 'package:vsa_mobile/app/modules/lessons/widgets/topics_list.dart';

// ignore: must_be_immutable
class LessonView extends StatelessWidget {
  // const LessonView({super.key});
  List<Topic> filter = [];
  String? query;

  LessonView({super.key});
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            title: Text("Bài học",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.011)),
            surfaceTintColor: Colors.transparent,
            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 245, 245),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                    // icon: const Icon(Icons.search),
                  ))
            ],
            backgroundColor: ColorClass.myBackground),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            SearchingBar(
                0.9 * context.width,
                context.height < horizontalHeight
                    ? 0.2 * context.height
                    : 0.05 * context.height,
                "Tìm kiếm chủ đề",
                TopicSearch()),
            Expanded(child: WordTopicList())
          ],
        ));
  }
}
