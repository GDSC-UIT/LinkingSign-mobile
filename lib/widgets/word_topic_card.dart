import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/screens/words_in_topic_view.dart';
import 'package:vsa_mobile/widgets/progress_circle.dart';

@immutable
class WordTopicCard extends StatelessWidget {
  // const WordTopicCard({super.key});
  final String urlPath;
  final String title;
  final double currentCompleted;
  final double totalLessons;
  final double screenWidth;
  final double screenHeight;
  const WordTopicCard({
    super.key,
    required this.urlPath,
    required this.title,
    required this.currentCompleted,
    required this.screenWidth,
    required this.screenHeight,
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
                    topic_name: title,
                    screen_width: screenWidth,
                    screen_height: screenHeight,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorClass.myTopicCardBG,
            borderRadius: BorderRadius.circular(20)),
        width: screenWidth * 0.5,
        height: screenHeight < 400 ? screenHeight * 0.3 : screenHeight * 0.15,
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
                        height: 0.1 * screenWidth,
                        width: 0.2 * screenWidth,
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
                        Text("Tiến độ $currentCompleted/$totalLessons ",
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
