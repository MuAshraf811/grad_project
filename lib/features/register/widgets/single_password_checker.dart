import 'package:flutter/material.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class SinglePasswordCheck extends StatelessWidget {
  const SinglePasswordCheck({
    super.key,
    required this.isPass8Char,
    required this.checkPart,
  });

  final bool isPass8Char;
  final String checkPart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isPass8Char
            ? const SvgHandler(
                imagePath: 'assets/svgs/right (1) 1.svg',
                color: ConstantColors.appMainColor,
                height: 14,
                width: 14,
                fit: BoxFit.contain)
            : const SvgHandler(
                imagePath: 'assets/svgs/wrong 1.svg',
                height: 14,
                width: 14,
                fit: BoxFit.contain),
        const HorizontalSpacer(width: 12),
        isPass8Char
            ? Text(
                checkPart,
                style: getRegularStyle(
                    fontSize: 12,
                    color: ConstantColors.appMainColor,
                    fontFamily: FontConstants.poppinsFontFamily),
              )
            : Text(
                checkPart,
                style: getRegularStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: FontConstants.poppinsFontFamily),
              ),
      ],
    );
  }
}
