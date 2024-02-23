import 'package:get/get.dart';
import 'package:vsa_mobile/app/modules/dictionary/screens/dictionary_screen.dart';
import 'package:vsa_mobile/app/modules/Learning/screens/learning_screen.dart';
import 'package:vsa_mobile/app/modules/lessons/screens/lesson_screen.dart';
import 'package:vsa_mobile/app/modules/practice/screens/practice_screen.dart';
import 'package:vsa_mobile/app/routes/app_routes.dart';
import 'package:vsa_mobile/app/global_widgets/bottom_nav_bar.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.navBar,
      page: () => MyBottomNavBar(),
    ),
    GetPage(
      name: AppRoutes.topic,
      page: () => LessonView(),
    ),
    GetPage(
      name: AppRoutes.dictionary,
      page: () => const DictionaryView(),
    ),
    GetPage(
      name: AppRoutes.practice,
      page: () => const PracticeView(),
    ),
    // GetPage(
    //   name: AppRoutes.learningScreen,
    //   page: () => const LearningScreen("", "", "", ""),
    // ),
    GetPage(
      name: AppRoutes.practiceFromLScreen,
      page: () => const PracticeView(),
    ),
  ];

  static getTopic() => AppRoutes.topic;
  static getDictionary() => AppRoutes.dictionary;
  static getPractice() => AppRoutes.practice;
}
