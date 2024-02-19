import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/global_widgets/example_image.dart';
import 'package:vsa_mobile/app/modules/dictionary/widgets/result.dart';
import 'package:vsa_mobile/app/modules/practice/widgets/my_camera.dart';
import 'package:vsa_mobile/app/modules/practice/widgets/result_notifications.dart';

@immutable
class PracticeWord extends StatelessWidget {
  String? word;
  String? exampleImage1;
  String? exampleImage2;
  PracticeWord(this.word, this.exampleImage1, this.exampleImage2, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 245, 245),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Result();
                        });
                  },
                  icon: const Icon(Icons.more_horiz),
                ))
          ],
          backgroundColor: ColorClass.myBackground,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                width: context.width,
                height: context.height * 0.2,
                decoration: const BoxDecoration(
                  color: ColorClass.darkMainColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(word!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20)),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        exampleImage(
                            context.height < horizontalHeight
                                ? context.width * 0.1
                                : context.width * 0.4,
                            context.height * 0.1,
                            exampleImage1!,
                            5),
                        exampleImage(
                            context.height < horizontalHeight
                                ? context.width * 0.1
                                : context.width * 0.4,
                            context.height * 0.1,
                            exampleImage2!,
                            5),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: MyCamera(Result()),
            )),
          ],
        ));
  }
}
