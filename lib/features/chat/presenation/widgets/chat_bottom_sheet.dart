import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Commonwidgets (1)/spacers.dart';
import '../../../../core/Commonwidgets (1)/svg_handler.dart';
import '../../../../core/styles/app_font_manager.dart';
import '../../../../core/styles/text_styles.dart';

Future<dynamic> showChatBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    constraints: BoxConstraints(minHeight: 180.h),
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SvgHandler(
                    imagePath: 'assets/svgs/camera-chat.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain),
                const HorizontalSpacer(width: 10),
                Text(
                  'Camera',
                  style: getMediumStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontFamily: FontConstants.poppinsFontFamily),
                ),
              ],
            ),
          ),
          const VerticalSpacer(height: 0.75),
          Container(
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SvgHandler(
                      imagePath: 'assets/svgs/gallery-chat.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain),
                  const HorizontalSpacer(width: 10),
                  Text(
                    'Photo',
                    style: getMediumStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontFamily: FontConstants.poppinsFontFamily),
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpacer(height: 0.75),
          Container(
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SvgHandler(
                    imagePath: 'assets/svgs/location.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain),
                const HorizontalSpacer(width: 10),
                Text(
                  'Location',
                  style: getMediumStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontFamily: FontConstants.poppinsFontFamily),
                ),
              ],
            ),
          ),
          const VerticalSpacer(height: 10),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 48.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Text(
                'Continue',
                style: getMediumStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontFamily: FontConstants.poppinsFontFamily),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
