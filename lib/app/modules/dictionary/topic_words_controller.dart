import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/word.dart';

class TopicWordsPairController extends GetxController {
  // var topic_word_pair = <TopicWordPairs>[].obs;
  var topic_word_pair = <String, List<Word>>{}.obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopicWordsPair();
  }

  void fetchWordTopicWordsPair() async {
    await Future.delayed(const Duration(seconds: 1));

    final actionTopic =
        word_data.where((element) => element.topicName == "action").toList();
    final fruitTopic =
        word_data.where((element) => element.topicName == "fruit").toList();
    final medicineTopic =
        word_data.where((element) => element.topicName == "medicine").toList();
    topic_word_pair.value = {
      "Hành động": actionTopic,
      "Trái cây": fruitTopic,
      "Y tế": medicineTopic,
    };
  }
}
