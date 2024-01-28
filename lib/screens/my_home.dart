import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/screens/lesson_view.dart';
import 'package:vsa_mobile/widgets/word_topics_list.dart';

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int current_position = 0;

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgetList = const [
    Text(
      'Home',
      style: TextStyle(fontSize: 20),
    ),
    Text(
      'Learn',
      style: TextStyle(fontSize: 20),
    ),
    Text(
      'Practice',
      style: TextStyle(fontSize: 20),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            )),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 245, 245),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ))
        ],
      ),
      body: const LessonView(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: current_position,
          selectedItemColor: ColorClass.mainColor,
          onTap: (index) {
            setState(() {
              current_position = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Bài học',
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.my_library_books_rounded,
              ),
              label: 'Từ điển',
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.abc,
              ),
              label: 'practice',
              backgroundColor: Colors.green,
            )
          ]),
    );
  }
}
