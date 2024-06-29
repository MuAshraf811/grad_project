import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize,
    this.fontColor,
    this.width,
    this.backgroundColor,
  });
  final String text;
  final double? fontSize;
  final double? width;
  final Color? fontColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? double.infinity,
          height: 38.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.teal,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: fontColor ?? Colors.white,
                fontSize: fontSize ?? 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
