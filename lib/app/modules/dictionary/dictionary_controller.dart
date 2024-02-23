import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/repositories/word_repository.dart';

class WordController extends GetxController {
  var repoWord = WordRepository();
  var wordsList = <Word>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  void fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));

    wordsList.value = await repoWord.fetchWords();
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
