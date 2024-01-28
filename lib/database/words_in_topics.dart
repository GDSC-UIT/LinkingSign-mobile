class TopicWordPairs {
  // String topic_name;
  // List<String> word_list;
  Map<String, List<String>> topic_words;
  TopicWordPairs({required this.topic_words});
}

var words_in_topic = {
  // Words(topic_name: "Đồ Ăn",word_list:["Cơm","Cháo","Hủ tiếu","Gà","Cháo","Bánh mì","Bánh ướt","Bánh xèo","Bánh hỏi"]),
  // Words(topic_name:),
  TopicWordPairs(topic_words: {
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
    ]
  }),
  TopicWordPairs(topic_words: {
    "Thể thao": [
      "Bóng đá",
      "Bóng bàn",
      "Bóng bầu dục",
      "Cầu lông",
      "Tennis",
      "Bóng ném",
      "Bơi lội"
    ]
  }),
  TopicWordPairs(topic_words: {
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
    ]
  }),
  TopicWordPairs(topic_words: {
    "Đồ chơi": [
      "Súng",
      "Kiếm",
      "lắp ghép",
      "lego",
      "cầu mây",
      "Dây nhảy",
      "cung tên",
      "cây viết"
    ]
  }),
  TopicWordPairs(topic_words: {
    "Học tập": [
      "Trường học",
      "Thầy cô",
      "Đồng phục",
      "Bạn học",
      "Bảng",
      "Phấn",
      "Viết",
      "Tập sách"
    ]
  }),
  TopicWordPairs(topic_words: {
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
  }),
};
