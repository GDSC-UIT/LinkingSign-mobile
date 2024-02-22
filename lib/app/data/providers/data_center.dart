import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/models/word.dart';

class DataCenter extends GetxController {
  static final DataCenter instance = DataCenter._internal();

  factory DataCenter() {
    return instance;
  }
  DataCenter._internal();
  RxList<Topic> topics = <Topic>[].obs;

  RxList<Word> words = <Word>[].obs;

  Future<void> fetchDataFromAPI() async {
    // get all data when begin app or refresh
  }
}
