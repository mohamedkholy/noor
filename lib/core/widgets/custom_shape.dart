import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.quadraticBezierTo(size.width * .2, size.height / 2, 0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - size.height * .1,
      size.width,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width * .2,
      size.height / 2,
      size.width,
      0,
    );
    path.quadraticBezierTo(size.width / 2, size.height * .1, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
