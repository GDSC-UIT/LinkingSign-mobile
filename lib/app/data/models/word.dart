class Word {
  String id;
  String? topic_id;
  String word;
  String video;
  String example1;
  String example2;
  bool is_learned;

  Word({
    required this.id,
    this.topic_id,
    required this.word,
    required this.example1,
    required this.example2,
    required this.video,
    required this.is_learned,
  });
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
        id: json['id'],
        topic_id: json['topic_id'],
        word: json['word_name'],
        example1: json['example1'],
        example2: json['example2'],
        video: json['video'],
        is_learned: json['is_learned']);
  }
  Map<String, dynamic> toJson() {
    var tojsonData = {
      'id': id,
      'topic_id': topic_id,
      'word_name': word,
      'example1': example1,
      'example2': example2,
      'video': video,
      'state': is_learned,
    };
    return tojsonData;
  }
}
//     "word_name": "test2",
//     "example1": "test2.url",
//     "example2": "test2.url",
//     "video": "testvideo2.url",
//     "is_learned": false