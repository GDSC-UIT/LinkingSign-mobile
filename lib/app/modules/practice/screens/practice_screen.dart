import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/core/const/const_dimension.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/global_widgets/example_image.dart';
import 'package:vsa_mobile/app/global_widgets/fail_notification.dart';
import 'package:vsa_mobile/app/modules/practice/practice_controller.dart';
import 'package:vsa_mobile/app/modules/practice/widgets/my_camera.dart';
import 'package:vsa_mobile/app/modules/practice/widgets/result_notifications.dart';

class PracticeView extends StatefulWidget {
  // const PracticeView({super.key});

  const PracticeView({super.key});

  @override
  State<PracticeView> createState() => _PracticeViewState();
}

class _PracticeViewState extends State<PracticeView> {
  //PracticeController controller = Get.put(PracticeController());
  PracticeController controller = Get.put(PracticeController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Luyện tập",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.011)),
          surfaceTintColor: Colors.transparent,
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
                          return const FailResult();
                        });
                  },
                  icon: const Icon(Icons.more_horiz),
                ))
          ],
          backgroundColor: ColorClass.myBackground,
        ),
        body: GetX<PracticeController>(builder: (controller) {
          Word reviewedWord = controller.wordReview();
          return Column(
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
                        child: Text(reviewedWord.word,
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
                              reviewedWord.example1,
                              5),
                          exampleImage(
                              context.height < horizontalHeight
                                  ? context.width * 0.1
                                  : context.width * 0.4,
                              context.height * 0.1,
                              reviewedWord.example2,
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
                child: MyCamera(const ResultNotification()),
              )),
            ],
          );
        }));
  }
}
