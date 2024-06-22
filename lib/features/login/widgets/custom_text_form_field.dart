import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomTextFormFiels extends StatelessWidget {
  const CustomTextFormFiels(
      {super.key,
      required this.hintText,
      required this.suffixIcon,
      required this.controller,
      required this.contentHorizontalPadding,
      required this.contentVerticalPadding,
      this.obsecureText = false,
      required this.validator,
      required this.horizontalPadding});
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final bool obsecureText;
  final String? Function(String?)? validator;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        validator: validator,
        cursorColor: ConstantColors.appMainColor,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: contentHorizontalPadding.w,
            vertical: contentVerticalPadding.h,
          ),
          suffixIcon: Icon(suffixIcon, color: ConstantColors.appMainColor),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: ConstantColors.appMainColor,
              width: 1.3.h,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 156, 28, 19),
              width: 1.3.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: ConstantColors.appMainColor,
              width: 1.3.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: ConstantColors.appMainColor,
              )),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: ConstantColors.appMainColor,
              width: 1.3.h,
            ),
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(12),
          //   borderSide: const BorderSide(
          //     color: ConstantColors.appMainColor,
          //     width: 1.3,
          //   ),
          // ),
        ),
      ),
    );
  }
}
