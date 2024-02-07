import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  // Để lấy screen size (context.screenSize)
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;
  // Để lấy icon size mặc định (context.iconSize)
  double? get iconSize => IconTheme.of(this).size;

  // Để lấy size của safe area (context.padding)
  EdgeInsets get padding => MediaQuery.of(this).padding;
}
