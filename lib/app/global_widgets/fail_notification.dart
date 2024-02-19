import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vsa_mobile/app/core/const/color.dart';

class FailResult extends StatefulWidget {
  const FailResult({super.key});

  @override
  State<FailResult> createState() => _FailResultState();
}

class _FailResultState extends State<FailResult>
    with SingleTickerProviderStateMixin {
  late AnimationController _checkIconController;

  @override
  void initState() {
    super.initState();
    _checkIconController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    _checkIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.4,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 500,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1 + 90,
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                        width: 2,
                        color: Colors.amber,
                      ))),
                  child: Lottie.asset("assets/fail.json",
                      controller: _checkIconController)),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1 + 30,
                child: Text("OOPS!, THỬ LẠI NHÉ".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
