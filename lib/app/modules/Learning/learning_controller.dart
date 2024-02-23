import 'package:get/get.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/repositories/word_repository.dart';

class LearningController extends GetxController {
  var word = Word(
          word: 'text',
          example1:
              "https://res.cloudinary.com/doypubnyj/image/upload/v1708624769/sau_rieng_1.jpg",
          example2:
              "https://res.cloudinary.com/doypubnyj/image/upload/v1708624769/sau_rieng_1.jpg",
          is_learned: false)
      .obs;
  var repoWord = WordRepository();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getSingleWord(String id) async {
    // Future.delayed(const Duration(seconds: 1));
    word.value = await repoWord.getSingleWord(id);
  }
}
