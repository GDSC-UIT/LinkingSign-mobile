import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:get/state_manager.dart';
import 'package:vsa_mobile/app/data/data.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:http/http.dart' as http;

class TopicsController extends GetxController {
  // List<WordTopic> topics = <WordTopic>[].obs;
  var topics = <Topic>[].obs;
  var isLoading = false.obs;

  var topicsFromDatabase = [
    Topic(
        imageUrl: "assets/topics/medicine/topic.jpg",
        topicName: 'Y tế',
        currentCompleted: 2,
        totalLessons: 7,
        state: 'Đang học'),
    Topic(
        imageUrl: "assets/topics/action/topic.jpg",
        topicName: 'Hành động',
        currentCompleted: 2,
        totalLessons: 7,
        state: 'Đang học'),
    Topic(
        imageUrl: "assets/topics/fruit/topic.jpg",
        topicName: 'Trái cây',
        currentCompleted: 2,
        totalLessons: 10,
        state: 'Đang học'),
    Topic(
        imageUrl: "assets/topics/emotion/topic.jpg",
        topicName: 'Cảm xúc',
        currentCompleted: 0,
        totalLessons: 7,
        state: 'Chưa học'),
    Topic(
        imageUrl: "assets/topics/transport/topic.jpg",
        topicName: 'Phương tiện',
        currentCompleted: 9,
        totalLessons: 9,
        state: 'Hoàn thành'),
  ];

  var data = word_data;
  @override
  void onInit() {
    super.onInit();
    fetchWordTopics();
  }

  // Future<void> fetchWordTopics() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   //topic y te
  //   //topics.value = topicsFromDatabase;

  // }
  Future<void> fetchWordTopics() async {
    await Future.delayed(const Duration(seconds: 2));
    topics.value = topicsFromDatabase;
    // try {
    //   print('fetch topics data');
    //   const url =
    //       "https://linkingsign.onrender.com/api/v1/topic?fbclid=IwAR3wwfzPMf9M7GQ3_mmXbRZvjoQsc1V1bM1mFnSikB2070C8s4o1Fs69LEQ";
    //   final uri = Uri.parse(url);
    //   final response = await http.get(uri);
    //   final body = response.body;
    //   List bodyData = jsonDecode(body)['data'];

    //   if (response.statusCode == 200) {
    //     print("print body data: $bodyData");
    //     List<Topic> mapData =
    //         bodyData.map((topic) => Topic.fromJson(topic)).toList();
    //     topics.value = mapData;
    //   } else {
    //     print("error happened ");
    //   }
    // } catch (e) {
    //   print("Error happened");
    //   print(e.toString());
    //   topics.value = topicsFromDatabase;
    // }
  }

  List<Topic> filterSearchingBar(String? queryTopic) {
    final splitQuery = queryTopic?.toLowerCase().trim().split(' ');
    List<Topic> result = [];
    for (int j = 0; j < topics.length; ++j) {
      final topicLower = topics[j].topicName.toLowerCase();
      for (int i = 0; i < splitQuery!.length; ++i) {
        if (topicLower.contains(splitQuery[i])) {
          result.add(topics[j]);
          break;
        }
      }
    }
    return result;
  }
}
