import 'dart:convert';

import 'package:vsa_mobile/app/core/url/url.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/service/http_service.dart';

class WordAPI {
  Future<List<Word>> fetchWords() async {
    String url = "$BASE_URL/word";
    final response = await HttpService.getRequest(url);
    List<Word> listGetWords = [];
    print('fetch words data');
    if (response.statusCode == 200) {
      final parsed = ((json.decode(response.body)['data'] ?? []) as List)
          .cast<Map<String, dynamic>>();
      listGetWords = parsed.map((topic) => Word.fromJson(topic)).toList();
      return listGetWords;
    } else {
      throw Exception(
          "Fail to get topics: ${jsonDecode(response.body)['error']}");
    }
  }

  Future<void> updateWords(Word word, bool isLearned) async {
    print("api is CALLINGIIIIIIIIIIIIIIIIIIIIIIIIIII");
    final word_id = word.id;
    Map<String, dynamic> body = {
      "topic_id": word.topic_id,
      "word_name": word.word,
      "example1": word.example1,
      "example2": word.example2,
      "video": word.video,
      "is_learned": isLearned,
    };

    final response = await HttpService.putRequest(
      url: "$BASE_URL/word/$word_id",
      body: jsonEncode(body),
    );
    //check status
    if (response.statusCode == 200) {
      print("word updated successfully");
      print("NOTICEEEEEEEEE SUCCESSSSSSSSSS");
    } else {
      print("PLEASE CHECKKKKKKK");
      throw Exception(
          'Fail to update topic: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<List<Word>> getWordsByTopicId(String topic_id) async {
    String WordInTopicUrl = "$BASE_URL/word?topic_id=$topic_id";
    final response = await HttpService.getRequest(WordInTopicUrl);
    List<Word> listGetWordsByTopic_Id = [];
    print('fetch topics data');
    if (response.statusCode == 200) {
      final parsed = ((json.decode(response.body)['data'] ?? []) as List)
          .cast<Map<String, dynamic>>();
      listGetWordsByTopic_Id =
          parsed.map((word) => Word.fromJson(word)).toList();
      return listGetWordsByTopic_Id;
    } else {
      print("Error happened in word_api.dart");
      throw Exception(
          "Fail to get topics: ${jsonDecode(response.body)['error']}");
    }
  }

  Future<Word> getSingleWord(String id) async {
    String word_url = "$BASE_URL/word/$id";
    final response = await HttpService.getRequest(word_url);

    if (response.statusCode == 200) {
      print('get single word');
      final parsed = json.decode(response.body)['data'];
      Word getWord = Word.fromJson(parsed);
      return getWord;
    } else {
      throw Exception(
          "Fail to get topics: ${jsonDecode(response.body)['error']}");
    }
  }
}
