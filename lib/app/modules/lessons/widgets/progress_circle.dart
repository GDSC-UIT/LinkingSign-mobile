// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vsa_mobile/app/core/const/color.dart';

@immutable
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
    var roundedPercentage = percent.toInt().toString();
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 10,
      percent: widget.currentValue / widget.maxValue,
      progressColor: ColorClass.mainColor,
      backgroundColor: ColorClass.myBackground,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text("$roundedPercentage %",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900)),
    );
  }
}
