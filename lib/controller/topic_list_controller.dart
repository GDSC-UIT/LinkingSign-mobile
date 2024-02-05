import 'package:get/state_manager.dart';
import 'package:vsa_mobile/model/wordtopic_model.dart';

class TopicsController extends GetxController {
  // List<WordTopic> topics = <WordTopic>[].obs;
  var topics = <WordTopic>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  void fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));

    var topicsFromDatabase = [
      WordTopic(
          url_path: "assets/image-1.svg",
          title: 'Đồ Ăn',
          current_completed: 0,
          total_lessons: 100,
          state: 'Chưa học'),
      WordTopic(
          url_path: "assets/image-2.svg",
          title: 'Thể thao',
          current_completed: 10,
          total_lessons: 60,
          state: 'Đang học'),
      WordTopic(
        url_path: "assets/image-3.svg",
        title: 'Người thân',
        current_completed: 25,
        total_lessons: 60,
        state: 'Đang học',
      ),
      WordTopic(
          url_path: "assets/image-4.svg",
          title: 'Đồ chơi',
          current_completed: 100,
          total_lessons: 100,
          state: 'Hoàn thành'),
      WordTopic(
          url_path: "assets/image-5.svg",
          title: '',
          current_completed: 0,
          total_lessons: 100,
          state: 'Chưa học'),

      ///testing area
      WordTopic(
          url_path: "assets/image-6.svg",
          title: 'Ăn bánh mì',
          current_completed: 15,
          total_lessons: 100,
          state: 'Đang học'),
      WordTopic(
          url_path: "assets/image-6.svg",
          title: 'game Ăn bánh',
          current_completed: 15,
          total_lessons: 100,
          state: 'Đang học'),
      WordTopic(
          url_path: "assets/image-6.svg",
          title: 'Chơi trốn tìm',
          current_completed: 15,
          total_lessons: 100,
          state: 'Đang học'),
      WordTopic(
          url_path: "assets/image-6.svg",
          title: 'Đồ Ăn ngon',
          current_completed: 15,
          total_lessons: 100,
          state: 'Đang học'),
    ];
    topics.value = topicsFromDatabase;
  }

  List<WordTopic> filterSearchingBar(String? queryTopic) {
    final splitQuery = queryTopic?.toLowerCase().trim().split(' ');
    List<WordTopic> result = [];
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
