import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color bluishclr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xffffb748);
const Color pinkClr = Color(0xffff4657);
const Color whiteClr = Colors.white;
const primaryClr = bluishclr;
const Color darkGreyClr = Color(0xff121212);
const Color darkHeaderClr = Color(0xff424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    appBarTheme: const AppBarTheme(color: Colors.white),
    brightness: Brightness.light,
    // colorScheme: ColorScheme(background: Colors.white, brightness: Brightness.light, primary: primaryClr, onPrimary: primaryClr, onBackground: null, ),
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    appBarTheme: const AppBarTheme(color: darkGreyClr),
    brightness: Brightness.dark,
    // colorScheme: ColorScheme(background: darkGreyClr),
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: "fonts/Lato-Regular.ttf",
    // color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[400],
    color: Colors.grey[400],
  );
}

TextStyle get headingStyle {
  return const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: "fonts/Lato-Regular.ttf",
  );
}

TextStyle get titleStyle {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "fonts/Lato-Regular.ttf",
  );
}

TextStyle get subtitleStyle {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "fonts/Lato-Regular.ttf",
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
  );
}
