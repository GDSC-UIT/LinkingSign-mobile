import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/word.dart';

class Data extends GetxController {
  RxList<Word> words = <Word>[].obs;

  @override
  void onInit() async {
    super.onInit();
    words.value = word_data;
  }
}
