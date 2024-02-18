import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/DataCenter.dart';
import 'package:vsa_mobile/app/data/data.dart';

class TopicWordsPairController extends GetxController {
  // var topic_word_pair = <TopicWordPairs>[].obs;
  var topic_word_pair = <String, List>{}.obs;
  late List data;
  @override
  void onInit() {
    super.onInit();
    data = Data().words;
    fetchWordTopicWordsPair();
  }

  void fetchWordTopicWordsPair() async {
    await Future.delayed(const Duration(seconds: 1));

    var actionTopic =
        word_data.where((element) => element.topicName == "action").toList();
    var fruitTopic =
        word_data.where((element) => element.topicName == "fruit").toList();
    var medicineTopic =
        word_data.where((element) => element.topicName == "medicine").toList();
    topic_word_pair.value = {
      "Hành động": actionTopic,
      "Trái cây": fruitTopic,
      "Y tế": medicineTopic,
    };
  }

  void updateLearningState(String? word, String topic) {
    topic_word_pair.forEach((key, value) {
      if (key != topic) return;
      for (int i = 0; i < value.length; ++i) {
        if (value[i].word == word) {
          topic_word_pair[key]?.elementAt(i).isLearned = true;
        }
      }
    });
  }
}
