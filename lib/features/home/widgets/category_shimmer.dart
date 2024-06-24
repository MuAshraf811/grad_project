import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
              ],
            ),
            const VerticalSpacer(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
