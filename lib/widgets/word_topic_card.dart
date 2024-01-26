import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vsa_mobile/database/wordtopic.dart';

class WordTopicCard extends StatelessWidget {
  // const WordTopicCard({super.key});
  final String url_path;
  final String title;
  final double current_completed;
  final double total_lessons;
  final double width;
  final double height;
  WordTopicCard({
    super.key,
    required this.url_path,
    required this.title,
    required this.current_completed,
    required this.width,
    required this.height,
    required this.total_lessons,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(59, 203, 204, 203),
            borderRadius: BorderRadius.circular(20)),
        width: width,
        height: height,
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
                        height: 0.1 * width,
                        width: 0.2 * width,
                        fit: BoxFit.contain)),
                Container(
                    // margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("Tiến độ $current_completed/$total_lessons ",
                            style: const TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Text("Circle")),
          ],
        ),
      ),
    );
  }
}
