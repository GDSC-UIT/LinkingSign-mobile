import 'dart:ffi';

import 'package:get/state_manager.dart';
import 'package:vsa_mobile/database/words_in_topics.dart';

class TopicWordsPairController extends GetxController {
  // var topic_word_pair = <TopicWordPairs>[].obs;
  var topic_word_pair = <String, List>{}.obs;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopicWordsPair();
  }

  void fetchWordTopicWordsPair() async {
    await Future.delayed(const Duration(seconds: 1));

    // var TopicWordPairsFromDatabase = [
    //   TopicWordPairs(topic_words: {
    //     "Đồ Ăn": [
    //       "Cơm",
    //       "Cháo",
    //       "Hủ tiếu",
    //       "Gà",
    //       "Cháo",
    //       "Bánh mì",
    //       "Bánh ướt",
    //       "Bánh xèo",
    //       "Bánh hỏi"
    //     ]
    //   }),
    //   TopicWordPairs(topic_words: {
    //     "Thể thao": [
    //       "Bóng đá",
    //       "Bóng bàn",
    //       "Bóng bầu dục",
    //       "Cầu lông",
    //       "Tennis",
    //       "Bóng ném",
    //       "Bơi lội"
    //     ]
    //   }),
    //   TopicWordPairs(topic_words: {
    //     "Người thân": [
    //       "Ông",
    //       "Bà",
    //       "Cha",
    //       "Mẹ",
    //       "Anh",
    //       "Chị",
    //       "Em",
    //       "Em họ",
    //       "Chú",
    //       "Bác"
    //     ]
    //   }),
    //   TopicWordPairs(topic_words: {
    //     "Đồ chơi": [
    //       "Súng",
    //       "Kiếm",
    //       "lắp ghép",
    //       "lego",
    //       "cầu mây",
    //       "Dây nhảy",
    //       "cung tên",
    //       "cây viết"
    //     ]
    //   }),
    //   TopicWordPairs(topic_words: {
    //     "Học tập": [
    //       "Trường học",
    //       "Thầy cô",
    //       "Đồng phục",
    //       "Bạn học",
    //       "Bảng",
    //       "Phấn",
    //       "Viết",
    //       "Tập sách"
    //     ]
    //   }),
    //   TopicWordPairs(topic_words: {
    //     "Lễ hội": [
    //       "Đua ghe",
    //       "Cúng đình",
    //       "Noel",
    //       "Tết",
    //       "Trung thu",
    //       "Tất niên",
    //       "Té nước",
    //       "Vu lan"
    //     ]
    //   }),
    // ];
    var TopicWordPairsFromDatabase = {
      "Đồ Ăn": [
        "Cơm",
        "Cháo",
        "Hủ tiếu",
        "Gà",
        "Cháo",
        "Bánh mì",
        "Bánh ướt",
        "Bánh xèo",
        "Bánh hỏi"
      ],
      "Thể thao": [
        "Bóng đá",
        "Bóng bàn",
        "Bóng bầu dục",
        "Cầu lông",
        "Tennis",
        "Bóng ném",
        "Bơi lội"
      ],
      "Người thân": [
        "Ông",
        "Bà",
        "Cha",
        "Mẹ",
        "Anh",
        "Chị",
        "Em",
        "Em họ",
        "Chú",
        "Bác"
      ],
      "Đồ chơi": [
        "Súng",
        "Kiếm",
        "lắp ghép",
        "lego",
        "cầu mây",
        "Dây nhảy",
        "cung tên",
        "cây viết"
      ],
      "Học tập": [
        "Trường học",
        "Thầy cô",
        "Đồng phục",
        "Bạn học",
        "Bảng",
        "Phấn",
        "Viết",
        "Tập sách"
      ],
      "Lễ hội": [
        "Đua ghe",
        "Cúng đình",
        "Noel",
        "Tết",
        "Trung thu",
        "Tất niên",
        "Té nước",
        "Vu lan"
      ]
    };

    topic_word_pair.value = TopicWordPairsFromDatabase;
  }
}
