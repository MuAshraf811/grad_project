import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.fontSize});
  final String text;
  final double? fontSize;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 38.h,
          decoration: BoxDecoration(
            color: ConstantColors.appMainColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
