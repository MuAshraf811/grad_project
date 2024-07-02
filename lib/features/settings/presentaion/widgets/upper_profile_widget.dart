import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpperProfileWidget extends StatelessWidget {
  const UpperProfileWidget({
    super.key,
    required this.email,
    required this.image,
    required this.name,
  });
  final String name;
  final String image;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(4.h),
        margin: EdgeInsets.all(5.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32.w,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(width: 24.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
