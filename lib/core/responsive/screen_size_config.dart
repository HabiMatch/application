import 'package:flutter/widgets.dart';

class ScreenSizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  static double scaleWidth(double inputWidth) {
    return (inputWidth / 375.0) * screenWidth; // Assuming 375 as base width
  }

  static double scaleHeight(double inputHeight) {
    return (inputHeight / 812.0) * screenHeight; // Assuming 812 as base height
  }

  static double scaleText(double fontSize) {
    return fontSize * textScaleFactor;
  }
}
