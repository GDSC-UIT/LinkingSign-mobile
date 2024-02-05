import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vsa_mobile/const/color.dart';
import 'package:vsa_mobile/screens/my_home.dart';
import 'dart:js';

// List<CameraDescription> cameras = [];
late CameraDescription firstCamera;
Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  firstCamera = cameras.first;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: ColorClass.mainColor,
        // ),
        scaffoldBackgroundColor: ColorClass.myBackground,
        useMaterial3: true,
        iconTheme: const IconThemeData(color: ColorClass.mainColor),
      ),
      home: MyHomePage(
        title: 'Khóa học của tôi',
        currentScreenNumber: 0,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
