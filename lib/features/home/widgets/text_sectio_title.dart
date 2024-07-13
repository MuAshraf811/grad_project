import 'package:flutter/material.dart';

import '../../../core/styles/app_font_manager.dart';
import '../../../core/styles/text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getRegularStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: FontConstants.poppinsFontFamily)
          .copyWith(letterSpacing: 1, fontWeight: FontWeight.w600),
    );
  }
}
