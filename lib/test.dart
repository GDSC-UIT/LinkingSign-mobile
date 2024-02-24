import 'package:vsa_mobile/app/core/enum/learning_state.dart';

final Map<String, String> Mapping = {
  "Đang học": "learning",
  "Hoàn thành": "learned",
  "Chưa học": "notLearning",
};
void main() {
  print(LearningStateTypes.toMap());
}
