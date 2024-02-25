import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/repositories/topic_repository.dart';

class TopicsController extends GetxController {
  var topics = <Topic>[].obs;
  var isLoading = true.obs;
  var repoTopic = TopicRepository();

  @override
  void onInit() async {
    super.onInit();
    fetchWordTopics();
    //Get.delete<TopicsController>();
    //Get.put(TopicsController());
  }

  Future<void> fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));
    topics.value = await repoTopic.fetchTopics();
    isLoading.value = false;
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
