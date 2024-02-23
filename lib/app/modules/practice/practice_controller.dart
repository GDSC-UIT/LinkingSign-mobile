import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:math';
import 'package:get/state_manager.dart';

class PracticeController extends GetxController {
  @override
  void onInit() {
    //fetchReviewWord();
    print("init practice controller");
    super.onInit();
  }

  final _random = Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  //Word wordReview(int number) {
  // return word_data[next(2, 15)];
  //}

  Future<void> fetchReviewWord() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
