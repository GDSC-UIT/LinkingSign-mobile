import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:math';

import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/word.dart';

class PracticeController extends GetxController {
  var review = Word(
          "Chào",
          "assets/videos/action/chao.mp4",
          "assets/topics/action/chao_1.jpg",
          "assets/topics/action/chao_2.jpg",
          "action",
          false)
      .obs;
  @override
  void onInit() {
    //fetchReviewWord();
    print("init practice controller");
    super.onInit();
  }

  final _random = Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  Word wordReview(int number) {
    return word_data[next(2, 15)];
  }

  Future<void> fetchReviewWord() async {
    await Future.delayed(const Duration(seconds: 2));

    review.value = wordReview(next(2, 20));
  }
}
