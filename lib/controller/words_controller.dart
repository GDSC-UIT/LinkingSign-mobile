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
}
