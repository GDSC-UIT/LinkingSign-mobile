import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/modules/word_in_topic/screens/words_in_topic_screen.dart';
import 'package:vsa_mobile/app/modules/lessons/widgets/progress_circle.dart';

@immutable
class WordTopicCard extends StatelessWidget {
  // const WordTopicCard({super.key});
  String topic_image;
  String? title;
  double? currentCompleted;
  double? totalLessons;
  WordTopicCard(
    this.topic_image,
    this.title,
    this.currentCompleted,
    this.totalLessons,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WordsInTopic(
                    topicName: title!,
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
                  child: Image(image: AssetImage(topic_image)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Container(
                        width: currentCompleted == 100 ? 100 : 80,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorClass.mainColor),
                        child: currentCompleted == 100
                            ? Text("Đã hoàn thành",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    letterSpacing: -0.011))
                            : Text(
                                "$currentCompleted/$totalLessons",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    letterSpacing: -0.6),
                              )),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: ProgressCircle(
                currentValue: currentCompleted!,
                maxValue: totalLessons!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
