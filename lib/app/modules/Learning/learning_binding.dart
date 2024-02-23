import 'package:get/get.dart';
import 'package:vsa_mobile/app/modules/Learning/learning_controller.dart';
import 'package:vsa_mobile/app/modules/lessons/topic_list_controller.dart';

class LearningBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearningController>(() => LearningController());
  }
}
