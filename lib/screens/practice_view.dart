import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/const/const_dimension.dart';
import 'package:vsa_mobile/widgets/example_image.dart';
import 'package:vsa_mobile/widgets/my_camera.dart';

class PracticeView extends StatelessWidget {
  // const PracticeView({super.key});
  final double screen_width;
  final double screen_height;

  PracticeView(
      {super.key, required this.screen_height, required this.screen_width});
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2), () {
    //   AwesomeDialog(
    //     context: context,
    //     dialogType: DialogType.success,
    //     animType: AnimType.bottomSlide,
    //     showCloseIcon: true,
    //     title: "Chúc mừng bạn",
    //     desc: "Làm tốt lắm!",
    //     btnOkOnPress: () {},
    //     btnCancelOnPress: () {},
    //   ).show();
    // });
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            margin: const EdgeInsets.only(left: 5, right: 5),
            alignment: Alignment.center,
            width: screen_height < horizontalHeight
                ? screen_width * 0.5
                : screen_width,
            decoration: BoxDecoration(
                color: ColorClass.darkMainColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text("Title",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    exampleImage(
                        screen_height < horizontalHeight
                            ? screen_width * 0.2
                            : screen_width * 0.4,
                        screen_height * 0.1,
                        'assets/image_test.jpg',
                        10),
                    exampleImage(
                        screen_height < horizontalHeight
                            ? screen_width * 0.2
                            : screen_width * 0.4,
                        screen_height * 0.1,
                        'assets/image_test.jpg',
                        10),
                  ],
                ),
              ],
            )),
        Flexible(
            fit: FlexFit.tight,
            child: MyCamera(
                screen_width: screen_height < horizontalHeight
                    ? screen_width * 0.8
                    : screen_width,
                screen_height: screen_height < horizontalHeight
                    ? screen_height * 0.5
                    : screen_height)),
      ],
    );
    //return MyCamera(screen_width: screen_width, screen_height: screen_height);
  }
}
