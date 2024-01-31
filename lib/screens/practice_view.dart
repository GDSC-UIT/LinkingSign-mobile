import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/widgets/my_camera.dart';

class PracticeView extends StatelessWidget {
  // const PracticeView({super.key});
  final double screen_width;
  final double screen_height;

  PracticeView(
      {super.key, required this.screen_height, required this.screen_width});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorClass.darkMainColor,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "https://th.bing.com/th/id/OIP.c6hZooTCPRBiufmsIRfDKQHaE8?rs=1&pid=ImgDetMain",
                  width: screen_width * 0.4,
                  height: screen_height * 0.2,
                ),
                Image.network(
                  "https://th.bing.com/th/id/OIP.c6hZooTCPRBiufmsIRfDKQHaE8?rs=1&pid=ImgDetMain",
                  width: screen_width * 0.4,
                  height: screen_height * 0.2,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: screen_width * 0.2),
            width: screen_width,
            height: screen_height * 0.52,
            child: MyCamera(),
          ),
        ]));
  }
}
