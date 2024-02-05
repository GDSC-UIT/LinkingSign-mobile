class WordTopic {
  final String url_path;
  final String title;
  final double current_completed;
  final double total_lessons;
  final String state;

  WordTopic(
      {required this.url_path,
      required this.title,
      required this.current_completed,
      required this.total_lessons,
      required this.state});
}
