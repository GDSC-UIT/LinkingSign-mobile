import 'package:camera/camera.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:math';
import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/repositories/media_repository.dart';
import 'package:vsa_mobile/app/data/repositories/word_repository.dart';

class PracticeController extends GetxController {
  var word_data = <Word>[].obs;
  var repoWords = WordRepository();
  var repoMedia = MediaRepository();
  @override
  void onInit() {
    fetchReviewWord();
    print("init practice controller");
    super.onInit();
  }

  final _random = Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  Word wordReview() {
    if (word_data.length == 0) {
      return Word(
          id: "55a33e97-30b5-499a-8120-b5c66a5e44e5",
          topic_id: "3aa2c2b4-92a0-4138-9a39-c68d7cc70f2d",
          word: "Chào",
          example1:
              "https://res.cloudinary.com/doypubnyj/image/upload/v1708614243/chao_1.jpg",
          example2:
              "https://res.cloudinary.com/doypubnyj/image/upload/v1708614296/chao_2.jpg",
          video:
              "https://res.cloudinary.com/doypubnyj/video/upload/v1708610319/chao.mp4",
          is_learned: false);
    }
    return word_data[next(0, 8)];
  }

  Future<void> fetchReviewWord() async {
    await Future.delayed(const Duration(seconds: 2));
    word_data.value = await repoWords.fetchWords();
  }

  Future<String> uploadVideo(XFile video_file) async {
    String video_url = await repoMedia.uploadVideo(video_file);
    return video_url;
  }
}
