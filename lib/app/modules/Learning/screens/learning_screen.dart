import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/modules/Learning/widgets/video_player.dart';
import 'package:vsa_mobile/app/global_widgets/example_image.dart';

class LearningScreen extends StatefulWidget {
  final String video_url;
  final String example1_url;
  final String example2_url;
  final String word;
  LearningScreen({
    required this.video_url,
    required this.example1_url,
    required this.example2_url,
    required this.word,
  });

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.word),
          surfaceTintColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
                width: context.width,
                height: context.height < horizontalHeight
                    ? context.height * 0.55
                    : context.height * 0.3,
                child: VideoDisplay(urlPath: widget.video_url)),
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
                            exampleImage(context.width * 0.8,
                                context.height * 0.25, widget.example1_url, 50),
                            const SizedBox(
                              height: 20,
                            ),
                            exampleImage(context.width * 0.8,
                                context.height * 0.25, widget.example2_url, 50),
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
            // PracticeButton(
            //     widget.word,
            //     ColorClass.mainColor,
            //     Colors.white,
            //     PracticeWord(
            //       widget.word,
            //       wordcontroller.wordforlearning.value.example1,
            //       wordcontroller.wordforlearning.value.example1,
            //     )),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
