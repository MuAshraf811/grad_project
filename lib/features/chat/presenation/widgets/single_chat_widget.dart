import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/features/chat/presenation/views/inner_chat_view.dart';
import '../../../../core/widgets/text_styles.dart';

class ChatModelWidget extends StatelessWidget {
  const ChatModelWidget({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    required this.onTap,
    required this.onDelete,
  });
  final String image;
  final String name;
  final String email;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'image',
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
          ),
          const HorizontalSpacer(width: 24),
          InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.textSize18AndW600Black,
                ),
                const VerticalSpacer(height: 6),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              const Text(
                '2 am',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const VerticalSpacer(height: 16),
              InkWell(
                onTap: onDelete,
                child: const SvgHandler(
                  imagePath: 'assets/svgs/trash.svg',
                  height: 20,
                  color: Colors.red,
                  width: 22,
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
