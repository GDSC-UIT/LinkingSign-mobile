import 'dart:convert';
import 'package:vsa_mobile/app/core/url/url.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/service/http_service.dart';

class TopicAPI {
  Future<List<Topic>> fetchTopics() async {
    const url = TOPIC_URL;
    final response = await HttpService.getRequest(url);
    List<Topic> listGetTopics = [];
    print('fetch topics data');
    if (response.statusCode == 200) {
      final parsed = ((json.decode(response.body)['data'] ?? []) as List)
          .cast<Map<String, dynamic>>();
      listGetTopics = parsed.map((topic) => Topic.fromJson(topic)).toList();
      return listGetTopics;
    } else {
      throw Exception(
          "Fail to get topics: ${jsonDecode(response.body)['error']}");
    }
  }

  Future<Topic> updateTopic(Topic topic) async {
    final response = await HttpService.putRequest(
      url: TOPIC_URL,
      body: jsonEncode(topic.toJson()),
    );

    //check status
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      var received_topic = Topic.fromJson(parsed);
      print("topic updated successfully");
      return received_topic;
    } else {
      throw Exception(
          'Fail to update topic: ${jsonDecode(response.body)['error']}');
    }
  }
}
