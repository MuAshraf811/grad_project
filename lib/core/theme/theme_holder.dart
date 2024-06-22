import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

class AppMainTheme {
  static ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ConstantColors.appMainColor,
    primaryColorDark: ConstantColors.appMainColor,
    colorScheme: const ColorScheme.dark(
      primary: ConstantColors.appMainColor,
      secondary: ConstantColors.appMainColor,
    ),
    textTheme: const TextTheme(),
  );
}
