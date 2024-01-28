import 'package:flutter/material.dart';
import 'package:circular/circular.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vsa_mobile/const/color.dart';

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
    var percent = (widget.currentValue / widget.maxValue) * 100;
    var rounded_percentage = percent.toInt().toString();
    return CircularPercentIndicator(
      radius: 40,
      lineWidth: 10,
      percent: widget.currentValue / widget.maxValue,
      progressColor: ColorClass.mainColor,
      backgroundColor: ColorClass.myBackground,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text("$rounded_percentage %",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900)),
    );
  }
}
