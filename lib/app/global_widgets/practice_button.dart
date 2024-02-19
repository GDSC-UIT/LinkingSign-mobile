import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/core/extension/buildcontext_ex.dart';
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
          Get.to(() => const PracticeView(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 500));
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
class PracticeButton extends StatelessWidget {
  // const PracticeButton({super.key});
  String title;

  Color bgColor;
  Color textColor;
  Widget targetScreen;

  PracticeButton(this.title, this.bgColor, this.textColor, this.targetScreen,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 5, left: 5),
      child: SizedBox(
        width: context.screenWidth * 0.4,
        height: context.screenHeight * 0.04,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => targetScreen,
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 500));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
          child: Text("Luyện tập",
              style: TextStyle(color: textColor), textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
