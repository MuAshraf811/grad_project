import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    required this.image,
    required this.location,
    required this.name,
    required this.price,
    required this.specialization,
  });
  final String image;
  final String name;
  final String specialization;
  final String price;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ConstantColors.appMainColor),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 34.w,
            backgroundImage: NetworkImage(image),
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            name,
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            specialization,
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            location,
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            "${price} EGP",
            style: getMediumStyle(fontSize: 13, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
