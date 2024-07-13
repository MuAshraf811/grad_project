import 'package:flutter/material.dart';

import '../../../core/Commonwidgets (1)/svg_handler.dart';
import '../../../core/styles/app_font_manager.dart';
import '../../../core/styles/text_styles.dart';

class FilerationCustomAppBar extends StatelessWidget {
  const FilerationCustomAppBar({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: const SvgHandler(
            imagePath: 'assets/svgs/arrow-left.svg',
            height: 24,
            width: 24,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(flex: 1),
        Text(
          'Filter',
          style: getMediumStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: FontConstants.poppinsFontFamily)
              .copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
