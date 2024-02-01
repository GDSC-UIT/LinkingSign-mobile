import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/screens/camera_test_pending.dart';
import 'package:vsa_mobile/screens/dictionary_view.dart';
import 'package:vsa_mobile/screens/lesson_view.dart';
import 'package:vsa_mobile/screens/practice_view.dart';
import 'package:vsa_mobile/widgets/my_camera.dart';
import 'package:vsa_mobile/widgets/word_topics_list.dart';

class MyHomePage extends StatefulWidget {
  int currentScreenNumber = 0;
  String title;

  MyHomePage(
      {super.key, required this.title, required this.currentScreenNumber});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// Obtain a list of the available cameras on the device.

// int currentScreenNumber = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    List<Widget> widgetList = [
      const LessonView(),
      const DictionaryView(),
      // TakePictureScreen(camera: widget.firstCamera),
      PracticeView(
        screen_width: screen_width,
        screen_height: screen_height,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            )),
        surfaceTintColor: Colors.transparent,
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
        backgroundColor: ColorClass.myBackground,
      ),
      body: widgetList.elementAt(widget.currentScreenNumber),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentScreenNumber,
          selectedItemColor: ColorClass.mainColor,
          onTap: (index) {
            setState(() {
              widget.currentScreenNumber = index;
              if (index == 0) {
                widget.title = "Khóa học của bạn";
              } else if (index == 1) {
                widget.title = "Từ điển";
              } else {
                widget.title = "Luyện tập";
              }
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
                Icons.waving_hand_rounded,
              ),
              label: 'practice',
              backgroundColor: Colors.green,
            )
          ]),
    );
  }
}
