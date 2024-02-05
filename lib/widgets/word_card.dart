import 'package:flutter/material.dart';
import 'package:vsa_mobile/screens/learning_view.dart';

@immutable
class WordCard extends StatelessWidget {
  // const WordCard({super.key});

  final double screenWidth;
  final double screenHeight;
  final Color circleColor;
  final Color number;
  final String title;
  final int startIndex;
  const WordCard(
      {super.key,
      required this.title,
      required this.startIndex,
      required this.screenWidth,
      required this.screenHeight,
      required this.circleColor,
      required this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight < 400 ? 0.25 * screenHeight : 0.15 * screenHeight,
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: circleColor,
          child: Text((startIndex + 1).toString(),
              style: TextStyle(fontSize: 20, color: number)),
        ),
        title: Text(title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            )),
        trailing: const Icon(Icons.check_circle_outline),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => LearningScreen(
                        screen_width: screenWidth * 2,
                        screen_height: screenHeight,
                        word: title,
                      )));
        },
      ),
    );
  }
}
