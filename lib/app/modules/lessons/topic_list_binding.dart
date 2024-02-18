import 'package:get/get.dart';
import 'package:vsa_mobile/app/modules/lessons/topic_words_controller.dart';
import 'package:vsa_mobile/app/modules/lessons/topic_list_controller.dart';

class TopicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicsController>(() => TopicsController());
    Get.lazyPut(() => TopicWordsPairController());
  }
}
