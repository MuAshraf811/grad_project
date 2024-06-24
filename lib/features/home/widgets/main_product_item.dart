import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class DummyProduct extends StatelessWidget {
  const DummyProduct({super.key, required this.image, required this.price});
  final String image;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150.w,
          height: 100.h,
          margin: EdgeInsets.only(left: 6.w, right: 2.w),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.contain),
              border:
                  Border.all(color: ConstantColors.appMainColor, width: 0.6),
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.withOpacity(0.15)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h, right: 8.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Colors.red.withOpacity(0.45),
                    child: SvgHandler(
                        imagePath: 'assets/svgs/heart.svg',
                        height: 16,
                        width: 16,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Colors.teal.withOpacity(0.5),
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 12.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.h,
          left: 6.5.w,
          child: Container(
            width: 40.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.7),
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(10.r))),
            alignment: Alignment.center,
            child: Text(
              "$price \$",
              style: getMediumStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
