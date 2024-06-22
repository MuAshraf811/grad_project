import 'package:flutter/material.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  String fontFamily,
) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({
  required double fontSize,
  required Color color,
  String fontFamily = FontConstants.poppinsFontFamily,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    fontFamily,
  );
}

// medium style

TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontConstants.poppinsFontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    fontFamily,
  );
}

// medium style

TextStyle getLightStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
    fontFamily,
  );
}

// bold style

TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    fontFamily,
  );
}

// semibold style

TextStyle getSemiBoldStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    fontFamily,
  );
}

TextStyle getHighStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.highBold,
    color,
    fontFamily,
  );
}
