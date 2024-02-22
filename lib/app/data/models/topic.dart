class Topic {
  String? id;
  String? imageUrl;
  late String topicName;
  late int currentCompleted;
  late int totalLessons;
  late String state;

  Topic(
      {required this.imageUrl,
      required this.topicName,
      required this.currentCompleted,
      required this.totalLessons,
      required this.state});
  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
        imageUrl: json['topic_image'],
        topicName: json['topic_name'],
        currentCompleted: json['number_learned_lesson'],
        totalLessons: json['total_lesson'],
        state: json['state']);
  }
  set setID(String id) => this.id = id;
  Map<String, dynamic> toJson() {
    var topic = {
      'image_url': imageUrl,
      'topic_name': topicName,
      'number_learned_lesson': currentCompleted,
      'total_lesson': totalLessons,
      'state': state
    };
    return topic;
  }
}
