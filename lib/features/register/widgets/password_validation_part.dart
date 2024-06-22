import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/register/widgets/single_password_checker.dart';

class PasswordValidationPart extends StatelessWidget {
  const PasswordValidationPart({
    super.key,
    required this.passStringth,
    required this.isPass8Char,
    required this.isPassHasNumOrSymol,
  });
  final String passStringth;
  final bool isPass8Char;
  final bool isPassHasNumOrSymol;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                passStringth == 'Strong'
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
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Password Strength : ',
                      style: getRegularStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: FontConstants.poppinsFontFamily),
                    ),
                    TextSpan(
                      text: passStringth,
                      style: passStringth == 'Weak'
                          ? getRegularStyle(
                              fontSize: 13,
                              color: Colors.red,
                              fontFamily: FontConstants.poppinsFontFamily)
                          : getRegularStyle(
                              fontSize: 13,
                              color: ConstantColors.appMainColor,
                              fontFamily: FontConstants.poppinsFontFamily),
                    ),
                  ]),
                ),
              ],
            ),
            const VerticalSpacer(height: 12),
            SinglePasswordCheck(
                isPass8Char: isPass8Char, checkPart: 'At Least 8 Characters'),
            const VerticalSpacer(height: 12),
            SinglePasswordCheck(
                isPass8Char: isPassHasNumOrSymol,
                checkPart: 'Contains A Number Or Symbol'),
            const VerticalSpacer(height: 12),
            SinglePasswordCheck(
                isPass8Char: isPassHasNumOrSymol,
                checkPart: 'Cannot Contain Your Name Or Email Address'),
          ],
        ),
      ),
    );
  }
}
