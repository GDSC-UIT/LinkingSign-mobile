//my old navigation bar

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vsa_mobile/app/core/const/color.dart';
// import 'package:vsa_mobile/app/modules/dictionary/screens/dictionary_screen.dart';
// import 'package:vsa_mobile/app/modules/lessons/screens/lesson_screen.dart';
// import 'package:vsa_mobile/app/modules/practice/screens/practice_screen.dart';

// // ignore: must_be_immutable
// class MyHomePage extends StatefulWidget {
//   int currentScreenNumber = 0;
//   String title;

//   MyHomePage(
//       {super.key, required this.title, required this.currentScreenNumber});
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// // Obtain a list of the available cameras on the device.

// // int currentScreenNumber = 0;

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> widgetList = [
//       LessonView(),
//       const DictionaryView(),
//       // TakePictureScreen(camera: widget.firstCamera),
//       const PracticeView(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title,
//             style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: -0.011)),
//         surfaceTintColor: Colors.transparent,
//         actions: [
//           Container(
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 247, 245, 245),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.more_horiz),
//                 // icon: const Icon(Icons.search),
//               ))
//         ],
//         backgroundColor: ColorClass.myBackground,
//       ),
//       body: widgetList.elementAt(widget.currentScreenNumber),
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: widget.currentScreenNumber,
//           selectedItemColor: ColorClass.mainColor,
//           onTap: (index) {
//             setState(() {
//               widget.currentScreenNumber = index;
//               if (index == 0) {
//                 widget.title = "Khóa học của bạn";
//               } else if (index == 1) {
//                 widget.title = "Từ điển";
//               } else {
//                 widget.title = "Luyện tập";
//               }
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: 'Bài học',
//               backgroundColor: Colors.orange,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.my_library_books_rounded,
//               ),
//               label: 'Từ điển',
//               backgroundColor: Colors.orange,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.waving_hand_rounded,
//               ),
//               label: 'practice',
//               backgroundColor: Colors.green,
//             )
//           ]),
//     );
//   }
// }
