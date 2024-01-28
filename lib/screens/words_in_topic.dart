import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';

class WordsInTopic extends StatefulWidget {
  // const WordsInTopic({super.key});
  final double height;
  final double width;
  // ignore: non_constant_identifier_names
  WordsInTopic({super.key, required this.height, required this.width});
  @override
  State<WordsInTopic> createState() => _WordsInTopicState();
}

final List<String> arr_name = [
  "First",
  "Second",
  "Third",
  "Fourth",
  "First",
  "Second",
  "Third",
  "Fourth"
];

class _WordsInTopicState extends State<WordsInTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đồ ăn",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: ColorClass.myBackground,
      ),
      body: Container(
        color: ColorClass.myBackground,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: arr_name.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: widget.width,
              height: widget.height,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text((index + 1).toString(),
                      style: const TextStyle(color: ColorClass.mainColor)),
                ),
                title: Text(arr_name[index]),
                trailing: const Icon(Icons.check_circle_outline),
                onTap: () {
                  print("Tap Tap the listile");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
  // child: ListTile(
  //                 leading: CircleAvatar(
  //                   backgroundColor: Colors.white,
  //                   child: Text((index + 1).toString(),
  //                       style: const TextStyle(color: ColorClass.mainColor)),
  //                 ),
  //                 title: const Text("Title content"),
  //                 trailing: Icon(Icons.play_circle_fill),
  //               ),