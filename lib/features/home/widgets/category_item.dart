import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 6.h),
      margin: EdgeInsets.only(left: 6.w),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: ConstantColors.appMainColor,
          width: 0.5.h,
        ),
      ),
      child: Container(
        height: 20.h,
        width: double.infinity,
        color: Colors.black54,
        alignment: Alignment.center,
        child: Text(
          title,
          style: getRegularStyle(fontSize: 12, color: Colors.white)
              .copyWith(letterSpacing: 0.4.w),
        ),
      ),
    );
  }
}
