import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/modules/lessons/topic_list_controller.dart';
import 'package:vsa_mobile/app/modules/dictionary/dictionary_controller.dart';
import 'package:vsa_mobile/app/global_widgets/word_card.dart';
import 'package:vsa_mobile/app/modules/lessons/topic_words_controller.dart';
import 'package:vsa_mobile/app/modules/lessons/widgets/topic_card.dart';

// ignore: must_be_immutable
class SearchingBar extends StatefulWidget {
  // const SearchingBar({super.key});

  double? width;
  double? height;
  String? hintText;
  SearchDelegate searchOptions;

  SearchingBar(this.width, this.height, this.hintText, this.searchOptions,
      {super.key});
  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  final topicsController = Get.put(TopicsController());
  late TextEditingController queryTopic = TextEditingController();

  @override
  void initState() {
    queryTopic = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    queryTopic.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   child: Container(
    //     width: widget.width,
    //     height: widget.height,
    //     // padding: const EdgeInsets.all(10),
    //     // margin: const EdgeInsets.only(top: 10),
    //     decoration: BoxDecoration(
    //         color: Colors.white, borderRadius: BorderRadius.circular(20)),
    //     alignment: Alignment.bottomCenter,
    //     child: TextField(
    //       controller: queryTopic,
    //       decoration: InputDecoration(
    //         border: InputBorder.none,
    //         hintText: widget.hintText,
    //         prefixIcon: const Icon(Icons.search),
    //       ),
    //       onEditingComplete: () {
    //         setState(() {
    //           widget.queryText = queryTopic.text;
    //         });
    //         print(widget.queryText);
    //       },
    //     ),
    //   ),
    // );
    // return Container(
    //   width: widget.width,
    //   height: widget.height,
    //   padding: const EdgeInsets.only(left: 10, right: 5),
    //   // margin: const EdgeInsets.only(top: 10),
    //   decoration: BoxDecoration(
    //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(widget.hintText!),
    //       IconButton(
    //           onPressed: () {
    //             showSearch(context: context, delegate: SearchingBarDelegate());
    //           },
    //           icon: Icon(Icons.search, color: Colors.black)),
    //     ],
    //   ),
    // );
    return GestureDetector(
      onTap: () async {
        await showSearch(context: context, delegate: widget.searchOptions);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.search, color: Colors.black),
            Text(widget.hintText!),
          ],
        ),
      ),
    );
  }
}

class TopicSearch extends SearchDelegate {
  final topicsController = Get.put(TopicWordsPairController());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetX<TopicWordsPairController>(builder: (controller) {
      List<Topic> topicResult = controller.filterSearchingBar(query);
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordTopicCard(
                urlPath: topicResult[index].urlPath,
                title: topicResult[index].title,
                currentCompleted: topicResult[index].currentCompleted,
                totalLessons: topicResult[index].totalLessons);
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetX<TopicWordsPairController>(builder: (controller) {
      List<Topic> topicResult = controller.filterSearchingBar(query);
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordTopicCard(
                urlPath: topicResult[index].urlPath,
                title: topicResult[index].title,
                currentCompleted: topicResult[index].currentCompleted,
                totalLessons: topicResult[index].totalLessons);
          });
    });
  }
}

class WordSearch extends SearchDelegate {
  final topicsController = Get.put(WordController());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetX<WordController>(builder: (controller) {
      List<Word> topicResult = controller.searchWord(query);
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordCard(
                false,
                topicResult[index].word,
                index,
                ColorClass.darkMainColor,
                Colors.white,
                topicResult.elementAt(index).video1url,
                topicResult.elementAt(index).image1url,
                topicResult.elementAt(index).image2url,
                topicResult.elementAt(index).isLearned);
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetX<WordController>(builder: (controller) {
      List<Word> topicResult = controller.searchWord(query);
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordCard(
                false,
                topicResult.elementAt(index).word,
                index,
                ColorClass.darkMainColor,
                Colors.white,
                topicResult.elementAt(index).video1url,
                topicResult.elementAt(index).image1url,
                topicResult.elementAt(index).image2url,
                topicResult.elementAt(index).isLearned);
          });
    });
  }
}
