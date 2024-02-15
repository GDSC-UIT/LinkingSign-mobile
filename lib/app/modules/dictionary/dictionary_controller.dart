import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/word.dart';

class WordController extends GetxController {
  // List<WordTopic> topics = <WordTopic>[].obs;
  var wordsList = <Word>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  void fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));
    var data = word_data;
    wordsList.value = data;
  }

  // getX improper usage because it does not have any observable variableso
  List<Word> searchWord(String? query) {
    List<Word> result = [];
    var lowerQuery = query?.toLowerCase();
    for (int i = 0; i < word_data.length; ++i) {
      var lowerWord = wordsList[i].word.toLowerCase();
      if (lowerWord.contains(lowerQuery!)) {
        result.add(wordsList[i]);
      }
    }
    return result;
  }
}
