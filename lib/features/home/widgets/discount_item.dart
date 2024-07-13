import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({
    super.key,
    required this.image,
    required this.discount,
    required this.beforePrice,
    required this.afterPrice,
  });
  final String image;
  final String discount;
  final String beforePrice;
  final String afterPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150.w,
          height: 80.h,
          margin: EdgeInsets.only(left: 4.w, right: 4),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.teal),
              color: Colors.grey.withOpacity(0.15)),
          child: Transform.rotate(
            angle: -40 * (3.14 / 180),
            child: Transform.translate(
              offset: Offset(4.w, -16.h),
              child: Container(
                width: 80.w,
                height: 18.h,
                padding: EdgeInsets.only(left: 14.h),
                alignment: Alignment.centerLeft,
                color: Colors.red.withOpacity(0.9),
                child: Text(
                  '$discount %',
                  style: getMediumStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        const VerticalSpacer(height: 3),
        SizedBox(
          width: 145.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$beforePrice EGP",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2.w,
                  fontFamily: FontConstants.poppinsFontFamily,
                  fontSize: 14,
                  color: Colors.teal,
                ),
              ),
              Text(
                " $afterPrice EGP",
                style: const TextStyle(
                  fontFamily: FontConstants.poppinsFontFamily,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
