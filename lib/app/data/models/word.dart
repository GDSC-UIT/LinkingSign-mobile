class Word {
  final String word;
  final String video1url;
  final String image1url;
  final String image2url;
  final String topicName;
  bool isLearned = false;

  Word({
    required this.word,
    required this.video1url,
    required this.image1url,
    required this.image2url,
    required this.topicName,
    required this.isLearned,
  });
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
        word: json['word'],
        video1url: json['video'],
        image1url: json['example1'],
        image2url: json['example2'],
        topicName: "",
        isLearned: json['is_learned']);
  }
  Map<String, dynamic> toJson() {
    var tojsonData = {
      'word': word,
      'video': video1url,
      'example1': image1url,
      'example2': image2url,
      'state': isLearned,
    };
    return tojsonData;
  }
}
//     "word_name": "test2",
//     "example1": "test2.url",
//     "example2": "test2.url",
//     "video": "testvideo2.url",
//     "is_learned": false