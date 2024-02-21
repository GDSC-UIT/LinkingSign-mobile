// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:vsa_mobile/app/modules/lessons/topic_list_controller.dart';

// class TestScreen extends StatefulWidget {
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   //const TestScreen({super.key});
//   var text = Get.put(TopicsController());

//   @override
//   Widget build(BuildContext context) {
//     return GetX<TopicsController>(builder: (controller) {
//       return Container(
//         width: context.width,
//         height: context.height,
//         child: Center(
//             child: Column(
//           children: [
//             Text(
//               controller.testData.value,
//               style: const TextStyle(color: Colors.amber, fontSize: 20),
//             ),
//             Image.network(controller.topic_image.value.toString()),
//           ],
//         )),
//       );
//     });
//   }
// }
