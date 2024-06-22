import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

class ClickableChatIcon extends StatelessWidget {
  const ClickableChatIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/mainChat');
        },
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
