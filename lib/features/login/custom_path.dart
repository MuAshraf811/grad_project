

import 'package:flutter/material.dart';

class CustomPath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(width, 0);
    path.quadraticBezierTo(width / 1.4, height / 1.2, 0, height - 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
