import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDiscount extends StatelessWidget {
  const ShimmerDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0.w,
              height: 80.0.h,
              color: Colors.grey,
            ),
            const HorizontalSpacer(width: 12),
            Container(
              width: 100.0.w,
              height: 80.0.h,
              color: Colors.grey,
            ),
            const HorizontalSpacer(width: 12),
            Container(
              width: 110.0.w,
              height: 80.0.h,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
