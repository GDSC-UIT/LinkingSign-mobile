import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';

class TopicWordsPairController extends GetxController {
  // var topic_word_pair = <TopicWordPairs>[].obs;
  var topic_word_pair = <String, List>{}.obs;
  var topics = <Topic>[].obs;
  late List data;
  @override
  void onInit() {
    super.onInit();
    fetchTopic();
    fetchWordTopicWordsPair();
  }

  void fetchTopic() async {
    await Future.delayed(const Duration(seconds: 2));
    topics.value = [
      //Topic("assets/topic-1.jpg", 'Y tế', 2, 7, 'Đang học'),
      //Topic("assets/topic-2.jpg", 'Trái cây', 0, 7, 'Chưa học'),
      //Topic("assets/topic-3.jpg", 'Hành động', 8, 8, 'Hoàn thành'),
    ];
  }

  void fetchWordTopicWordsPair() async {
    await Future.delayed(const Duration(seconds: 1));

    var actionTopic =
        word_data.where((element) => element.topicName == "action").toList();
    var fruitTopic =
        word_data.where((element) => element.topicName == "fruit").toList();
    var medicineTopic =
        word_data.where((element) => element.topicName == "medicine").toList();
    var emotionTopic =
        word_data.where((element) => element.topicName == "emotion").toList();
    var transportTopic =
        word_data.where((element) => element.topicName == "transport").toList();
    topic_word_pair.value = {
      "Hành động": actionTopic,
      "Trái cây": fruitTopic,
      "Y tế": medicineTopic,
      "Cảm xúc": emotionTopic,
      "Phương tiện": transportTopic
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

  List<Topic> filterSearchingBar(String? queryTopic) {
    final splitQuery = queryTopic?.toLowerCase().trim().split(' ');
    List<Topic> result = [];
    for (int j = 0; j < topics.length; ++j) {
      final topicLower = topics[j].topicName.toLowerCase();
      for (int i = 0; i < splitQuery!.length; ++i) {
        if (topicLower.contains(splitQuery[i])) {
          result.add(topics[j]);
          break;
        }
      }
    }
    return result;
  }
}
