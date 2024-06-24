import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Container(
        height: 30.h,
        width: 84.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ConstantColors.appMainColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(4.r)),
        child: Text(
          title,
          style: getMediumStyle(
            fontSize: 13,
            color: Colors.white,
          ).copyWith(letterSpacing: 0.7),
        ),
      ),
    );
  }
}
