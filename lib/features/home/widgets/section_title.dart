import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Text(
        title,
        style: getMediumStyle(
          fontSize: 14,
          color: Colors.teal,
        ).copyWith(letterSpacing: 0.7),
      ),
    );
  }
}
