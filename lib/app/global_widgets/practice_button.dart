import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';

import 'package:vsa_mobile/app/global_widgets/my_home.dart';
import 'package:vsa_mobile/app/modules/practice/screens/practice_screen.dart';

Widget practiceButton(String title, Color BGcolor, Color textColor,
    double screenWidth, double screenHeight, Function onPressed) {
  return Padding(
    padding: const EdgeInsets.only(right: 5, top: 5, left: 5),
    child: SizedBox(
      width: screenWidth * 0.4,
      height: screenHeight < horizontalHeight ? 100 : screenHeight * 0.04,
      child: ElevatedButton(
        onPressed: () {
          // Get.off(MyHomePage(title: "Luyện tập", currentScreenNumber: 2));
          Get.off(() => const PracticeView(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
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
  double screenWidth;
  double screenHeight;
  Color bgColor;
  Color textColor;
  Function onPressed;

  PracticeButton(this.title, this.screenWidth, this.screenHeight, this.bgColor,
      this.textColor, this.onPressed,
      {super.key});
  @override
  State<PracticeButton> createState() => _PracticeButtonState();
}

class _PracticeButtonState extends State<PracticeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 5, left: 5),
      child: SizedBox(
        width: widget.screenHeight < horizontalHeight
            ? widget.screenWidth * 0.05
            : widget.screenWidth * 0.2,
        height: widget.screenHeight < horizontalHeight
            ? 100
            : widget.screenHeight * 0.04,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.bgColor = Colors.white;
              widget.textColor = Colors.black;
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.bgColor,
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
