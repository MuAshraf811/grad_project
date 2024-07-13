import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_font_manager.dart';
import '../../../core/styles/text_styles.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({super.key, required this.switchVal, required this.title});
  bool switchVal;
  final String title;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 170.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: getMediumStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: FontConstants.poppinsFontFamily)
                  .copyWith(letterSpacing: 1, fontWeight: FontWeight.w600),
            ),
            // const HorizontalSpacer(width: 32),
            SizedBox(
              height: 16.h,
              child: Transform.scale(
                scale: 0.8,
                child: Switch(
                    activeTrackColor: Colors.teal,
                    thumbColor: const MaterialStatePropertyAll(Colors.white),
                    value: widget.switchVal,
                    inactiveThumbColor: Colors.teal,
                    focusColor: Colors.teal.withOpacity(0.5),
                    trackOutlineColor:
                        const MaterialStatePropertyAll(Colors.teal),
                    onChanged: (val) {
                      setState(() {
                        widget.switchVal = val;
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
