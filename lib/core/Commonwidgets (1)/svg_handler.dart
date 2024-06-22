import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SvgHandler extends StatelessWidget {
  const SvgHandler({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.fit,
    this.color,
  });
  final String imagePath;
  final double height;
  final double width;
  final BoxFit fit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      height: height.h,
      width: width.w,
      fit: fit,
      color: color ?? null,
      theme: SvgTheme(currentColor: color ?? Colors.transparent),
    );
  }
}
