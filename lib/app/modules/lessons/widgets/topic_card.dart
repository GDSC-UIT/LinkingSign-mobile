import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/modules/lessons/screens/words_in_topic_screen.dart';
import 'package:vsa_mobile/app/modules/lessons/widgets/progress_circle.dart';

@immutable
class WordTopicCard extends StatelessWidget {
  // const WordTopicCard({super.key});
  final String urlPath;
  final String title;
  final double currentCompleted;
  final double totalLessons;
  const WordTopicCard({
    super.key,
    required this.urlPath,
    required this.title,
    required this.currentCompleted,
    required this.totalLessons,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WordsInTopic(
                    topicName: title,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        decoration: BoxDecoration(
            color: ColorClass.myTopicCardBG,
            borderRadius: BorderRadius.circular(20)),
        width: context.width * 0.5,
        height:
            context.height < 400 ? context.height * 0.3 : context.height * 0.15,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: SvgPicture.asset(urlPath,
                        height: 50, width: 50, fit: BoxFit.fill)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    // Text("Tiến độ $currentCompleted/$totalLessons ",
                    //     style: const TextStyle(
                    //         color: ColorClass.mainColor,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 15)),
                    Container(
                        margin: const EdgeInsets.only(left: 0),
                        width: 80,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorClass.mainColor),
                        child: Text(
                          "$currentCompleted/$totalLessons",
                          style: const TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: ProgressCircle(
                currentValue: currentCompleted,
                maxValue: totalLessons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
