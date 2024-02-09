import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:vsa_mobile/app/modules/dictionary/screens/dictionary_screen.dart';
import 'package:vsa_mobile/app/modules/lessons/screens/lesson_screen.dart';
import 'package:vsa_mobile/app/modules/practice/screens/practice_screen.dart';
import 'package:vsa_mobile/app/data/controller/nav_bar_controller.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

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
          index: controller.tabIndex,
          children: [
            LessonView(),
            const DictionaryView(),
            const PracticeView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorClass.mainColor,
          currentIndex: controller.tabIndex,
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
              label: 'practice',
              backgroundColor: Colors.green,
            )
          ],
        ),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
