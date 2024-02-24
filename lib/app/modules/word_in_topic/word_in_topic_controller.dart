import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/repositories/word_repository.dart';

class WordsInTopicController extends GetxController {
  var words = <Word>[].obs;
  var repoWord = WordRepository();
  @override
  void onInit() {
    super.onInit();
    fetchWordTopicWordsPair();
  }

  void getWordByTopicId(String topic_id) async {
    //await Future.delayed(const Duration(seconds: 1));
    print("Print get function by topic");
    words.value = await repoWord.getWordsByTopicId(topic_id);
  }

  void fetchWordTopicWordsPair() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void updateLearningState(Word word) async {
    print("FUNCTION IS CALLINGGGGGGGGG");
    await repoWord.updateWord(word, false);
  }

  List<Topic> filterSearchingBar(String? queryTopic) {
    final splitQuery = queryTopic?.toLowerCase().trim().split(' ');
    List<Topic> result = [];
    // for (int j = 0; j < topics.length; ++j) {
    //   final topicLower = topics[j].topicName.toLowerCase();
    //   for (int i = 0; i < splitQuery!.length; ++i) {
    //     if (topicLower.contains(splitQuery[i])) {
    //       result.add(topics[j]);
    //       break;
    //     }
    //   }
    // }
    return result;
  }
}
