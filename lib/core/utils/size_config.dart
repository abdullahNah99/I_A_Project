import 'dart:developer';
import 'package:flutter/material.dart';

final class SizeConfig {
  static bool _isInitialized = false;
  static late final double screenWidth;
  static late final double screenHeight;
  static late final double defaultSize;
  static late final Orientation orientation;

  static void init(BuildContext context) {
    if (!_isInitialized) {
      _isInitialized = true;
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
      orientation = MediaQuery.of(context).orientation;

      defaultSize = orientation == Orientation.landscape
          ? screenHeight * .024
          : screenWidth * .024;

      log("this is the default size $defaultSize");
    }
  }
}
