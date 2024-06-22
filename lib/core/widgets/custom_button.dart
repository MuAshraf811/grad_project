import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.text,
    this.borderRaduis,
    this.textColor,
    this.buttonColor,
    this.fontSize,
  });
  final double width;
  final double height;
  final String text;
  final void Function()? onTap;
  final double? borderRaduis;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      splashColor: ConstantColors.appMainColor.withOpacity(0.2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor ?? ConstantColors.appMainColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(borderRaduis ?? 24),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
