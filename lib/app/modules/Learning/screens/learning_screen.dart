import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/modules/Learning/learning_controller.dart';
import 'package:vsa_mobile/app/modules/Learning/screens/practice_word.dart';
import 'package:vsa_mobile/app/modules/Learning/widgets/video_player.dart';
import 'package:vsa_mobile/app/global_widgets/example_image.dart';
import 'package:vsa_mobile/app/global_widgets/practice_button.dart';

class LearningScreen extends StatefulWidget {
  String id;
  String word;
  LearningScreen(this.id, this.word, {super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  final LearningController wordcontroller = Get.put(LearningController());

  @override
  void initState() {
    wordcontroller.getSingleWord(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
        surfaceTintColor: Colors.transparent,
      ),
      body: GetX<LearningController>(builder: (controller) {
        return Column(
          children: [
            Container(
                width: context.width,
                height: context.height < horizontalHeight
                    ? context.height * 0.55
                    : context.height * 0.3,
                child: VideoDisplay(urlPath: controller.word.value.video!)),
            Visibility(
              visible: context.height < horizontalHeight ? false : true,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(widget.word,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Visibility(
              visible: context.height < horizontalHeight ? false : true,
              child: const Text("Hình minh họa bên dưới",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
            ),
            Expanded(
              child: Visibility(
                  // ignore: sort_child_properties_last
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            exampleImage(
                                context.width * 0.8,
                                context.height * 0.25,
                                controller.word.value.example1!,
                                50),
                            const SizedBox(
                              height: 20,
                            ),
                            exampleImage(
                                context.width * 0.8,
                                context.height * 0.25,
                                controller.word.value.example2!,
                                50),
                          ],
                        ),
                      )),
                  visible: context.height < horizontalHeight ? false : true),
            ),
            const SizedBox(
              height: 20,
            ),
            // practiceButton("Luyện tập", ColorClass.darkMainColor, Colors.white,
            //     context.width, context.height, () {}),
            PracticeButton(
                widget.word,
                ColorClass.mainColor,
                Colors.white,
                PracticeWord(widget.word, controller.word.value.example1,
                    controller.word.value.example2)),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }),
    );
  }
}
