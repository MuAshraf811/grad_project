import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/chat/logic/cubit/chat_cubit.dart';

import '../../../../core/Commonwidgets (1)/spacers.dart';
import '../../../../core/Commonwidgets (1)/svg_handler.dart';
import '../../../../core/styles/app_font_manager.dart';
import '../../../../core/styles/text_styles.dart';
import 'chat_bottom_sheet.dart';

class SendMessageFormField extends StatelessWidget {
  const SendMessageFormField({
    super.key,
    required this.onSend,
  });
  final VoidCallback onSend;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.3.h))),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 18.w, bottom: 10.h, top: 4.h),
        child: TextFormField(
          controller: context.read<ChatCubit>().chatController,
          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(
              maxHeight: 36.h,
              maxWidth: 36.w,
            ),
            hintText: '   Write A Message .....',
            hintStyle: getRegularStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: FontConstants.poppinsFontFamily),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(bottom: 2.h, right: 10.w),
              child: InkWell(
                onTap: () {
                  showChatBottomSheet(context);
                },
                child: Icon(
                  Icons.add_box_rounded,
                  size: 22.w,
                  color: Colors.teal,
                ),
              ),
            ),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const HorizontalSpacer(width: 12),
                InkWell(
                  onTap: onSend,
                  child: const SvgHandler(
                    imagePath: 'assets/svgs/send.svg',
                    height: 22,
                    width: 24,
                    color: Colors.teal,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
