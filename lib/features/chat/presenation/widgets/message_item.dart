import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Commonwidgets (1)/spacers.dart';
import '../../../../core/styles/app_font_manager.dart';
import '../../../../core/styles/text_styles.dart';

class MessageItem extends StatelessWidget {
  const MessageItem(
      {super.key,
      required this.isSender,
      required this.text,
      required this.image});

  final bool isSender;
  final String text;

  final String image;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isSender
              ? Colors.grey.withOpacity(0.3)
              : Colors.teal.withOpacity(0.12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: Text(
                text,
                style: getRegularStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: FontConstants.poppinsFontFamily,
                ),
              ),
            ),
            const VerticalSpacer(height: 8),
            Text(
              '1:30 am',
              style: getRegularStyle(
                fontSize: 10,
                color: Colors.grey,
                fontFamily: FontConstants.poppinsFontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
