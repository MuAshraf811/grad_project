import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

class TextStyles {
  static const textSize32AndBoldBlack = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const textSize20AndBoldBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const textSize16AndSemiBoldBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const textSize20AndBoldTeal = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ConstantColors.appMainColor,
  );
  static const textSize20AndSemiBoldTeal = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ConstantColors.appMainColor,
  );

  static const textSize18AndW600Teal = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ConstantColors.appMainColor,
  );

  static const textSize18AndW600Black = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
