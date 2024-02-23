import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/modules/dictionary/screens/dictionary_screen.dart';
import 'package:vsa_mobile/app/modules/lessons/screens/lesson_screen.dart';
import 'package:vsa_mobile/app/data/controller/nav_bar_controller.dart';
import 'package:vsa_mobile/app/modules/practice/screens/practice_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  //MyBottomNavBar({super.key});

  const MyBottomNavBar();
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());
    return GetBuilder<NavController>(builder: (context) {
      return Scaffold(
        backgroundColor: HexColor("#F6FBFA"),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            LessonView(),
            const DictionaryView(),
            //Container(),
            const PracticeView()
            //TestScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorClass.mainColor,
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
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
              label: 'Luyện tập',
              backgroundColor: Colors.green,
            )
          ],
        ),
      );
    });
  }
}
