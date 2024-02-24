enum LearningStateTypes {
  learning,
  learned,
  unlearning;

  @override
  String toString() {
    switch (this) {
      case LearningStateTypes.learning:
        return "Đang học";
      case LearningStateTypes.learned:
        return "Hoàn thành";
      case LearningStateTypes.unlearning:
        return "Chưa học";
    }
  }

  static Map<LearningStateTypes, String> toMap() {
    return {
      LearningStateTypes.learned: "Đã học",
      LearningStateTypes.learning: "Đang học",
      LearningStateTypes.unlearning: "Chưa học"
    };
  }
}
