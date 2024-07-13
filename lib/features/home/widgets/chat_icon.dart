import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

class ClickableChatIcon extends StatelessWidget {
  const ClickableChatIcon({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: onTap,
        child: const ImageIcon(
          size: 35,
          color: ConstantColors.appMainColor,
          AssetImage(
            'images/other/chat_icon.png',
          ),
        ),
      ),
    );
  }
}
