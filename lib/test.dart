void main() {
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
  print(TopicWordPairsFromDatabase["Đồ Ăn"]?.elementAt(2));
}
