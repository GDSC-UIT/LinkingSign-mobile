import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  // const WordCard({super.key});

  final double custom_width;
  final double custom_height;
  final Color circle_color;
  final Color number_in_circle_color;
  final String title_field;
  final int start_index;
  WordCard(
      {required this.title_field,
      required this.start_index,
      required this.custom_width,
      required this.custom_height,
      required this.circle_color,
      required this.number_in_circle_color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: custom_width,
      height: custom_height,
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: circle_color,
          child: Text((start_index + 1).toString(),
              style: TextStyle(fontSize: 20, color: number_in_circle_color)),
        ),
        title: Text("$title_field",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            )),
        trailing: const Icon(Icons.check_circle_outline),
        onTap: () {
          print("Tap Tap the listile");
        },
      ),
    );
  }
}
