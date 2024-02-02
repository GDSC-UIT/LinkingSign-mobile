import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/database/wordtopic_model.dart';
import 'package:vsa_mobile/screens/words_in_topic_view.dart';
import 'package:vsa_mobile/widgets/progress_circle.dart';

class WordTopicCard extends StatelessWidget {
  // const WordTopicCard({super.key});
  final String url_path;
  final String title;
  final double current_completed;
  final double total_lessons;
  final double screen_width;
  final double screen_height;
  WordTopicCard({
    super.key,
    required this.url_path,
    required this.title,
    required this.current_completed,
    required this.screen_width,
    required this.screen_height,
    required this.total_lessons,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WordsInTopic(
                    topic_name: title,
                    screen_width: screen_width,
                    screen_height: screen_height,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
              color: ColorClass.myTopicCardBG,
              borderRadius: BorderRadius.circular(20)),
          width: screen_width * 0.6,
          height:
              screen_height < 400 ? screen_height * 0.3 : screen_height * 0.15,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: SvgPicture.asset(url_path,
                          height: 0.1 * screen_width,
                          width: 0.2 * screen_width,
                          fit: BoxFit.contain)),
                  Container(
                      // margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          Text("Tiến độ $current_completed/$total_lessons ",
                              style: const TextStyle(
                                  color: ColorClass.mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                      )),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: ProgressCircle(
                  currentValue: current_completed,
                  maxValue: total_lessons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
