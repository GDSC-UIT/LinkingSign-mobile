import 'package:get/state_manager.dart';
import 'package:vsa_mobile/database/wordtopic_model.dart';

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

    var TopicsFromDatabase = [
      WordTopic(
          url_path: "assets/image-1.svg",
          title: 'Đồ Ăn',
          current_completed: 40,
          total_lessons: 100),
      WordTopic(
          url_path: "assets/image-2.svg",
          title: 'Thể thao',
          current_completed: 24,
          total_lessons: 60),
      WordTopic(
        url_path: "assets/image-3.svg",
        title: 'Người thân',
        current_completed: 25,
        total_lessons: 60,
      ),
      WordTopic(
          url_path: "assets/image-4.svg",
          title: 'Đồ chơi',
          current_completed: 77,
          total_lessons: 100),
      WordTopic(
          url_path: "assets/image-5.svg",
          title: 'Học tập',
          current_completed: 16,
          total_lessons: 100),
      WordTopic(
          url_path: "assets/image-6.svg",
          title: 'Lễ hội',
          current_completed: 15,
          total_lessons: 100),
    ];
    topics.value = TopicsFromDatabase;
  }
}
