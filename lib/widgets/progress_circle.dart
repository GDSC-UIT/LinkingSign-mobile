import 'package:flutter/material.dart';
import 'package:circular/circular.dart';

// class ProgressCircle extends StatefulWidget {
//   double maxValue;
//   double currentValue;
//   ProgressCircle(
//       {super.key, required this.currentValue, required this.maxValue});
//   @override
//   State<ProgressCircle> createState() => _ProgressCircleState();
// }

// class _ProgressCircleState extends State<ProgressCircle> {
//   @override
//   Widget build(BuildContext context) {
//     return CircularViewer(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(200),
//         boxShadow: const [
//           BoxShadow(
//               offset: Offset(-20, -20),
//               color: Colors.white,
//               blurRadius: 20,
//               spreadRadius: 1),
//           BoxShadow(
//               offset: Offset(20, 20),
//               color: Color.fromARGB(255, 158, 158, 158),
//               blurRadius: 20,
//               spreadRadius: 1)
//         ],
//       ),
//       value: widget.currentValue,
//       maxValue: widget.maxValue,
//       radius: 50,
//       textStyle: TextStyle(fontSize: 30),
//       color: Color(0xffEEEEEE),
//       sliderColor: Color(0xff62CBDA),
//       unSelectedColor: Color(0xffD7DEE7),
//     );
//   }
// }

class ProgressCircle extends StatefulWidget {
  double currentValue;
  double maxValue;
  ProgressCircle(
      {super.key, required this.currentValue, required this.maxValue});
  @override
  State<ProgressCircle> createState() => _ProgressCircleState();
}

class _ProgressCircleState extends State<ProgressCircle> {
  @override
  Widget build(BuildContext context) {
    return CircularViewer(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-10, -10),
                color: Colors.white,
                blurRadius: 20,
                spreadRadius: 1),
            BoxShadow(
                offset: Offset(10, 10),
                color: Color.fromARGB(255, 158, 158, 158),
                blurRadius: 20,
                spreadRadius: 1)
          ]),
      value: widget.currentValue,
      maxValue: widget.maxValue,
      radius: 30,
      textStyle: TextStyle(fontSize: 30),
      color: Color(0xffEEEEEE),
      sliderColor: Color(0xff62CBDA),
      unSelectedColor: Color(0xffD7DEE7),
    );
  }
}
