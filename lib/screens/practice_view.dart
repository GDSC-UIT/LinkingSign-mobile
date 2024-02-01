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
    return Stack(
      fit: StackFit.expand,
      children: [
        const Text("Cơm",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w800)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              width: screen_width,
              height: screen_height * 0.2,
              // decoration: BoxDecoration(
              //     color: ColorClass.darkMainColor,
              //     borderRadius: BorderRadius.circular(20)),
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
            MyCamera(screen_width: screen_width, screen_height: screen_height),
          ],
        ),
      ],
    );
  }
}
