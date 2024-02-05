import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/screens/my_home.dart';

Widget practiceButton(String title, Color BGcolor, Color textColor,
    double screen_width, double screen_height, Function onPressed) {
  return Padding(
    padding: const EdgeInsets.only(right: 5, top: 5, left: 5),
    child: SizedBox(
      width: screen_height < horizontalHeight
          ? screen_width * 0.05
          : screen_width * 0.2,
      height: screen_height < horizontalHeight ? 100 : screen_height * 0.04,
      child: ElevatedButton(
        onPressed: () {
          Get.off(MyHomePage(title: "Luyện tập", currentScreenNumber: 2));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: BGcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
        child: Text(title,
            style: TextStyle(color: textColor), textAlign: TextAlign.center),
      ),
    ),
  );
}

// ignore: must_be_immutable
class PracticeButton extends StatefulWidget {
  // const PracticeButton({super.key});
  String title;
  double screen_width;
  double screen_height;
  Color BGcolor;
  Color textColor;
  Function onPressed;

  PracticeButton(this.title, this.screen_width, this.screen_height,
      this.BGcolor, this.textColor, this.onPressed);
  @override
  State<PracticeButton> createState() => _PracticeButtonState();
}

class _PracticeButtonState extends State<PracticeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 5, left: 5),
      child: SizedBox(
        width: widget.screen_height < horizontalHeight
            ? widget.screen_width * 0.05
            : widget.screen_width * 0.2,
        height: widget.screen_height < horizontalHeight
            ? 100
            : widget.screen_height * 0.04,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.BGcolor = Colors.white;
              widget.textColor = Colors.black;
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.BGcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
          child: Text(widget.title,
              style: TextStyle(color: widget.textColor),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
