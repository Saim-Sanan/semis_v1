import 'package:flutter/material.dart';

class Pallete {
  static const blueColor = Color.fromRGBO(3, 72, 139, 1);
  static const secondaryColor = Color.fromRGBO(3, 72, 139, 0.1);
  static const greenColor = Color.fromRGBO(1, 65, 28, 1);
  static const whiteColor = Colors.white;
  static const blackColor = Color.fromRGBO(0, 0, 0, 1);

  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
  );
}
