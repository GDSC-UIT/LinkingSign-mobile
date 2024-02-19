import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';

class TopicsController extends GetxController {
  // List<WordTopic> topics = <WordTopic>[].obs;
  var topics = <Topic>[].obs;
  var topicsFromDatabase = [
    Topic("assets/topic-1.jpg", 'Y tế', 2, 7, 'Đang học'),
    Topic("assets/topic-2.jpg", 'Trái cây', 0, 7, 'Chưa học'),
    Topic("assets/topic-3.jpg", 'Hành động', 8, 8, 'Hoàn thành'),
  ];
  var data = word_data;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  Future<void> fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));
    //topic y te
    topics.value = topicsFromDatabase;
  }

  List<Topic> filterSearchingBar(String? queryTopic) {
    final splitQuery = queryTopic?.toLowerCase().trim().split(' ');
    List<Topic> result = [];
    for (int j = 0; j < topics.length; ++j) {
      final topicLower = topics[j].title.toLowerCase();
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
