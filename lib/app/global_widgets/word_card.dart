import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/modules/dictionary/screens/learning_screen.dart';

@immutable
class WordCard extends StatelessWidget {
  // const WordCard({super.key});
  final bool circleVisible;
  final Color circleColor;
  final Color number;
  final String title;
  final int startIndex;
  const WordCard(
      {super.key,
      required this.circleVisible,
      required this.title,
      required this.startIndex,
      required this.circleColor,
      required this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 10, right: 20, top: 10),
      alignment: Alignment.center,
      width: context.width,
      height:
          context.height < 400 ? 0.2 * context.height : 0.1 * context.height,

      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Visibility(
          visible: circleVisible,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: circleColor,
            child: Text((startIndex + 1).toString(),
                style: TextStyle(fontSize: 20, color: number)),
          ),
        ),
        title: Text(title,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        trailing: const Icon(Icons.check_circle_outline),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => LearningScreen(
                        screenWidth: context.width * 2,
                        screenHeight: context.height,
                        word: title,
                      )));
        },
      ),
    );
  }
}
