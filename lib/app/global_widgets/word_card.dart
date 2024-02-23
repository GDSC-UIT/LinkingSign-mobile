import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/modules/Learning/screens/learning_screen.dart';

@immutable
class WordCard extends StatelessWidget {
  // const WordCard({super.key});
  final String word_id;
  final bool circleVisible;
  final Color circleColor;
  final String? urlPath;
  final String? urlPic1;
  final String? urlPic2;
  final Color number;
  final String? title;
  final int startIndex;
  bool islearned;
  WordCard(
      this.circleVisible,
      this.title,
      this.startIndex,
      this.circleColor,
      this.number,
      this.urlPath,
      this.urlPic1,
      this.urlPic2,
      this.islearned,
      this.word_id,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      alignment: Alignment.center,
      width: context.width,
      height:
          context.height < 400 ? 0.2 * context.height : 0.1 * context.height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LearningScreen(
                    video_url: urlPath!,
                    example1_url: urlPic1!,
                    example2_url: urlPic2!,
                    word: title!)),
          );
        },
        leading: Visibility(
          visible: circleVisible,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: circleColor,
            child: Text((startIndex + 1).toString(),
                style: TextStyle(fontSize: 20, color: number)),
          ),
        ),
        title: Text(title == null ? "text" : title!,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        trailing: islearned
            ? const Icon(Icons.abc)
            : const Icon(Icons.check_circle_outline),
      ),
    );
  }
}
