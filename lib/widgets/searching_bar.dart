import 'package:flutter/material.dart';

@immutable
class SearchingBar extends StatefulWidget {
  // const SearchingBar({super.key});

  final double width;
  final double height;
  final String hintText;

  SearchingBar(
      {super.key,
      required this.width,
      required this.height,
      required this.hintText});
  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search your topics here...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
