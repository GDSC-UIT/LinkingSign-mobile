import 'package:flutter/material.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/screens/my_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: ColorClass.mainColor,
        // ),
        scaffoldBackgroundColor: ColorClass.myBackground,
        useMaterial3: true,
        iconTheme: const IconThemeData(color: ColorClass.mainColor),
      ),
      home: MyHomePage(title: 'Khóa học của tôi'),
      debugShowCheckedModeBanner: false,
    );
  }
}
