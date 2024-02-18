import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vsa_mobile/app/modules/practice/practice_controller.dart';

class PracticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticeController>(() => PracticeController());
  }
}
