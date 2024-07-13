// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class CustomRadioButton<T> extends StatefulWidget {
  CustomRadioButton({
    super.key,
    required this.title,
    required this.groupVal,
    required this.val,
    required this.onChanged,
    this.titleColor,
  });
  final String title;
  Color? titleColor;
  T groupVal;
  T val;
  void Function(dynamic)? onChanged;
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
          child: Transform.scale(
            scale: 1.05,
            child: RadioListTile(
              dense: true,
              splashRadius: 0,
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
              activeColor: ConstantColors.appMainColor,
              fillColor: const MaterialStatePropertyAll(
                ConstantColors.appMainColor,
              ),
              value: widget.val,
              groupValue: widget.groupVal,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: widget.onChanged,
            ),
          ),
        ),
        const HorizontalSpacer(width: 14),
        Text(
          widget.title,
          style: getRegularStyle(
                  fontSize: 14,
                  color: widget.titleColor ?? Colors.black87,
                  fontFamily: FontConstants.poppinsFontFamily)
              .copyWith(letterSpacing: 1, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
