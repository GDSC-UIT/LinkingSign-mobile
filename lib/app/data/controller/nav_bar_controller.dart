import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
