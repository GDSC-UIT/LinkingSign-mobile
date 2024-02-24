import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/repositories/word_repository.dart';

class WordController extends GetxController {
  var repoWord = WordRepository();
  var wordsList = <Word>[].obs;
  var wordforlearning = Word(
          id: "b70fdd68-d1ed-4712-b817-2b1ab890f0ad",
          word: "Nho",
          example1:
              "https://res.cloudinary.com/doypubnyj/image/upload/v1708624727/nho_1.jpg",
          example2:
              "https://res.cloudinary.com/doypubnyj/image/upload/v1708624747/nho_2.jpg",
          video:
              "https://res.cloudinary.com/doypubnyj/video/upload/v1708624394/nho.mp4",
          is_learned: false)
      .obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  void fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));

    wordsList.value = await repoWord.fetchWords();
  }

  void getSingleWord(String id) async {
    Future.delayed(const Duration(seconds: 2));
    wordforlearning.value = await repoWord.getSingleWord(id);
  }

  List<Word> searchWord(String query) {
    List<Word> result = [];
    var lowerQuery = query.toLowerCase();
    for (int i = 0; i < wordsList.length; ++i) {
      String lowerWord = wordsList[i].word.toLowerCase();
      if (lowerWord.contains(lowerQuery)) {
        result.add(wordsList[i]);
      }
    }
    return result;
  }
}
