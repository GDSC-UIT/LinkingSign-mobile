import 'package:get/get.dart';
import 'package:vsa_mobile/app/modules/lessons/topic_list_controller.dart';

class TopicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicsController>(() => TopicsController());
  }
}
