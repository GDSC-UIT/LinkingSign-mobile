// class WordTopic {
//   String? url_path;
//   String? title;
//   double? current_completed = 0;
//   double? total_lessons;

//   WordTopic({
//     this.url_path,
//     this.title,
//     this.current_completed,
//     this.total_lessons,
//   });
// }

class WordTopic {
  final String url_path;
  final String title;
  final double current_completed;
  final double total_lessons;

  WordTopic({
    required this.url_path,
    required this.title,
    required this.current_completed,
    required this.total_lessons,
  });
}

List<WordTopic> wordtopicList = [
  WordTopic(
      url_path: "assets/image-1.svg",
      title: 'Đồ Ăn',
      current_completed: 40,
      total_lessons: 100),
  WordTopic(
      url_path: "assets/image-2.svg",
      title: 'Thể thao',
      current_completed: 30,
      total_lessons: 60),
  WordTopic(
    url_path: "assets/image-3.svg",
    title: 'Người thân',
    current_completed: 25,
    total_lessons: 60,
  ),
  WordTopic(
      url_path: "assets/image-4.svg",
      title: 'Đồ chơi',
      current_completed: 50,
      total_lessons: 100),
  WordTopic(
      url_path: "assets/image-5.svg",
      title: 'Học tập',
      current_completed: 50,
      total_lessons: 100),
  WordTopic(
      url_path: "assets/image-6.svg",
      title: 'Lễ hội',
      current_completed: 50,
      total_lessons: 100),
];
