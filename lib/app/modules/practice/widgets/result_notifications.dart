import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsa_mobile/app/core/const/color.dart';
import 'package:lottie/lottie.dart';

class ResultNotification extends StatefulWidget {
  const ResultNotification({super.key});

  @override
  State<ResultNotification> createState() => _ResultNotificationState();
}

class _ResultNotificationState extends State<ResultNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController _checkIconController;
  @override
  void initState() {
    super.initState();
    _checkIconController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
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
                color: ColorClass.mainColor,
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
                        color: ColorClass.mainColor,
                      ))),
                  child: Lottie.asset("assets/checkAnimation.json",
                      controller: _checkIconController)),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1 + 60,
                child: Text("Làm tốt lắm!".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1 + 10,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {},
                    child: Text(
                      "Từ tiếp theo",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )))
          ],
        ),
      ),
    );
  }
}
