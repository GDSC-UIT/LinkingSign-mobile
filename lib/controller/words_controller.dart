import 'package:get/state_manager.dart';

class WordController extends GetxController {
  // List<WordTopic> topics = <WordTopic>[].obs;
  var words_list = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  void fetchWordTopics() async {
    await Future.delayed(Duration(seconds: 2));

    var wordsFromDataBase = [
      "Cơm",
      "Cháo",
      "Hủ tiếu",
      "Gà",
      "Cháo",
      "Bánh mì",
      "Bánh ướt",
      "Bánh xèo",
      "Bánh hỏi",
      "Bóng đá",
      "Bóng bàn",
      "Bóng bầu dục",
      "Cầu lông",
      "Tennis",
      "Bóng ném",
      "Bơi lội",
      "Ông",
      "Bà",
      "Cha",
      "Mẹ",
      "Anh",
      "Chị",
      "Em",
      "Em họ",
      "Chú",
      "Bác",
      "Súng",
      "Kiếm",
      "lắp ghép",
      "lego",
      "cầu mây",
      "Dây nhảy",
      "cung tên",
      "cây viết",
      "Trường học",
      "Thầy cô",
      "Đồng phục",
      "Bạn học",
      "Bảng",
      "Phấn",
      "Viết",
      "Tập sách",
      "Đua ghe",
      "Cúng đình",
      "Noel",
      "Tết",
      "Trung thu",
      "Tất niên",
      "Té nước",
      "Vu lan"
    ];

    words_list.value = wordsFromDataBase;
  }

  // getX improper usage because it does not have any observable variableso
  List<String> searchWord(String? query) {
    List<String> result = [];
    var lowerQuery = query?.toLowerCase();
    for (int i = 0; i < words_list.length; ++i) {
      var lowerWord = words_list[i].toLowerCase();
      if (lowerWord.contains(lowerQuery!)) {
        result.add(words_list[i]);
      }
    }
    return result;
  }
}
