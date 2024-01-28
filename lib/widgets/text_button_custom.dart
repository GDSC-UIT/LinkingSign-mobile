import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';

class TextButtonCustom extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback Function;
  final String title;
  final Color textColor;
  final Color buttonColor;

  TextButtonCustom(
      {super.key,
      required this.title,
      required this.Function,
      required this.width,
      required this.height,
      required this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: Function,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: ColorClass.mainColor)),
        ),
      ),
    );
  }
}
