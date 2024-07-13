import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_font_manager.dart';
import '../../../core/styles/text_styles.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({
    super.key,
    required this.val,
    required this.title,
  });
  bool val;
  final String title;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.teal,
          side: const BorderSide(width: 1, color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          value: widget.val,
          onChanged: (value) {
            setState(() {
              widget.val = value!;
            });
          },
        ),
        Text(
          widget.title,
          style: getRegularStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: FontConstants.poppinsFontFamily)
              .copyWith(letterSpacing: 1, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
