import 'package:get/get_state_manager/get_state_manager.dart';

class NavController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void getToPracticeScreen(int index) {
    tabIndex = 2;
    update();
  }
}
