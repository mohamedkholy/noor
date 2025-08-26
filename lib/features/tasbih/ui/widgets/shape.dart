import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';

class Shape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(size.width * .13, size.height - (size.height * .4));
    path.lineTo(size.width * .15, size.height - (size.height * .4) + 50);
    path.cubicTo(
      size.width * .12,
      size.height + 50,
      size.width - size.width * .12,
      size.height + 50,
      size.width - size.width * .15,
      size.height - (size.height * .4) + 50,
    );
    path.lineTo(
      size.width - size.width * .13,
      size.height - (size.height * .4),
    );
    path.quadraticBezierTo(
      size.width,
      size.height * .3,
      size.width - size.width * .12,
      size.height * .05,
    );
    path.cubicTo(
      size.width - size.width * .2,
      -60,
      size.width * .2,
      -60,
      size.width * .12,
      size.height * .05,
    );
    path.quadraticBezierTo(
      0,
      size.height * .3,
      size.width * .13,
      size.height - (size.height * .4),
    );
    path.close();
    canvas.drawPath(path, paint);
    final borderPaint = Paint()
      ..color = Color.lerp(MyColors.primary, Colors.black, 0.1)!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
