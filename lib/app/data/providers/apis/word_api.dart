import 'dart:convert';

import 'package:vsa_mobile/app/core/url/url.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/service/http_service.dart';

class WordAPI {
  Future<List<Word>> fetchWords() async {
    const url = WORD_URL;
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

  Future<Word> updateWords(Word word) async {
    final response = await HttpService.putRequest(
      url: TOPIC_URL,
      body: jsonEncode(word.toJson()),
    );

    //check status
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      var received_word = Word.fromJson(parsed);
      print("word updated successfully");
      return received_word;
    } else {
      throw Exception(
          'Fail to update topic: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<List<Word>> getWordsByTopicId(String topic_id) async {
    String WordInTopicUrl = "$WORD_URL?topic_id=$topic_id";
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
    String word_url = "$WORD_URL/$id";
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
