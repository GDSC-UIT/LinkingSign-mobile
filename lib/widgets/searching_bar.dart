// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/controller/topic_list_controller.dart';
import 'package:vsa_mobile/controller/words_controller.dart';
import 'package:vsa_mobile/database/wordtopic_model.dart';
import 'package:vsa_mobile/widgets/word_card.dart';
import 'package:vsa_mobile/widgets/word_topic_card.dart';

@immutable
class SearchingBar extends StatefulWidget {
  // const SearchingBar({super.key});

  double? width;
  double? height;
  String? hintText;
  SearchDelegate SearchOptions;

  SearchingBar(this.width, this.height, this.hintText, this.SearchOptions,
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
      onTap: () {
        showSearch(context: context, delegate: widget.SearchOptions);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.hintText!),
            const Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class TopicSearch extends SearchDelegate {
  final topicsController = Get.put(TopicsController());
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
    return GetX<TopicsController>(builder: (controller) {
      List<WordTopic> topicResult = controller.filterSearchingBar(query);
      final screen_width = MediaQuery.of(context).size.width;
      final screen_height = MediaQuery.of(context).size.height;
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordTopicCard(
                url_path: topicResult[index].url_path,
                title: topicResult[index].title,
                current_completed: topicResult[index].current_completed,
                screen_width: screen_width,
                screen_height: screen_height,
                total_lessons: topicResult[index].total_lessons);
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return GetX<TopicsController>(builder: (controller) {
      List<WordTopic> topicResult = controller.filterSearchingBar(query);
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordTopicCard(
                url_path: topicResult[index].url_path,
                title: topicResult[index].title,
                current_completed: topicResult[index].current_completed,
                screen_width: screen_width,
                screen_height: screen_height,
                total_lessons: topicResult[index].total_lessons);
          });
    });
  }
}

// class WordSearch extends SearchDelegate {
//   final wordsController = Get.put(WordController());
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.clear)),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return GetX<WordController>(builder: (controller) {
//       List<String> topicResult = controller.searchWord(query);
//       final screen_width = MediaQuery.of(context).size.width;
//       final screen_height = MediaQuery.of(context).size.height;
//       return ListView.builder(
//           itemCount: topicResult.length,
//           itemBuilder: (context, index) {
//             return WordCard(
//                 title_field: topicResult[index],
//                 start_index: index,
//                 screen_width: screen_width,
//                 screen_height: screen_height,
//                 circle_color: ColorClass.darkMainColor,
//                 number_in_circle_color: Colors.white);
//           });
//     });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return GetX<WordController>(builder: (controller) {
//       List<String> topicResult = controller.searchWord(query);
//       final screen_width = MediaQuery.of(context).size.width;
//       final screen_height = MediaQuery.of(context).size.height;
//       return ListView.builder(
//           itemCount: topicResult.length,
//           itemBuilder: (context, index) {
//             return WordCard(
//                 title_field: topicResult[index],
//                 start_index: index,
//                 screen_width: screen_width,
//                 screen_height: screen_height,
//                 circle_color: ColorClass.darkMainColor,
//                 number_in_circle_color: Colors.white);
//           });
//     });
//   }
// }
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
      List<String> topicResult = controller.searchWord(query);
      final screen_width = MediaQuery.of(context).size.width;
      final screen_height = MediaQuery.of(context).size.height;
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordCard(
                title_field: topicResult[index],
                start_index: index,
                screen_width: screen_width,
                screen_height: screen_height,
                circle_color: ColorClass.darkMainColor,
                number_in_circle_color: Colors.white);
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return GetX<WordController>(builder: (controller) {
      List<String> topicResult = controller.searchWord(query);
      return ListView.builder(
          itemCount: topicResult.length,
          itemBuilder: (context, index) {
            return WordCard(
                title_field: topicResult[index],
                start_index: index,
                screen_width: screen_width,
                screen_height: screen_height,
                circle_color: ColorClass.darkMainColor,
                number_in_circle_color: Colors.white);
          });
    });
  }
}
