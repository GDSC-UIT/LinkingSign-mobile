import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';

import 'package:vsa_mobile/app/global_widgets/example_image.dart';
import 'package:vsa_mobile/app/modules/practice/widgets/my_camera.dart';

class PracticeView extends StatelessWidget {
  // const PracticeView({super.key});

  const PracticeView({super.key});
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            alignment: Alignment.bottomCenter,
            width: context.height < horizontalHeight
                ? context.width * 0.5
                : context.width,
            height: context.height * 0.2,
            decoration: BoxDecoration(
              color: ColorClass.darkMainColor,
              // borderRadius: BorderRadius.circular(10),
            ),
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
                        context.height < horizontalHeight
                            ? context.width * 0.2
                            : context.width * 0.4,
                        context.height * 0.1,
                        'assets/image_test.jpg',
                        10),
                    exampleImage(
                        context.height < horizontalHeight
                            ? context.width * 0.2
                            : context.height * 0.4,
                        context.height * 0.1,
                        'assets/image_test.jpg',
                        10),
                  ],
                ),
              ],
            )),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: MyCamera(
              screenWidth: context.width, screenHeight: context.height),
        )),
      ],
    );
    //return MyCamera(screen_width: screen_width, screen_height: screen_height);
  }
}
//  MyCamera(
//                 screen_width: screen_height < horizontalHeight
//                     ? screen_width * 0.8
//                     : screen_width,
//                 screen_height: screen_height < horizontalHeight
//                     ? screen_height * 0.5
//                     : screen_height)),