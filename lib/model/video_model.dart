class WordVideoModel {
  int? id;
  String? word;
  String? videoUrl;
  String? picture1Url;
  String? picture2Url;

  WordVideoModel({
    this.id,
    this.word,
    this.videoUrl,
    this.picture1Url,
    this.picture2Url,
  });
  WordVideoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    word = json["word"];
    videoUrl = json["videoUrl"];
    picture1Url = json["picture1Url"];
    picture2Url = json["picture2Url"];
  }
}
