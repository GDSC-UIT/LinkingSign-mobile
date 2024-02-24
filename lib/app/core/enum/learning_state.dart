enum LearningStateTypes {
  learning,
  learned,
  notLearning;

  static Map<String, String> Mapping = {
    "learning": "Đang học",
    "learned": "Hoàn thành",
    "notLearning": "Đã học",
  };
  @override
  String toString() {
    switch (this) {
      case LearningStateTypes.learning:
        return "Đang học";
      case LearningStateTypes.learned:
        return "Hoàn thành";
      case LearningStateTypes.notLearning:
        return "Chưa học";
    }
  }

  // tomap
  static Map<LearningStateTypes, String> toMap() {
    return {
      LearningStateTypes.notLearning: "Chưa học",
      LearningStateTypes.learning: "Đang học",
      LearningStateTypes.learned: "Đã học"
    };
  }
}
