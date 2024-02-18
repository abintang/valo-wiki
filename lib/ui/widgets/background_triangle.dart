import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/core/app_colors.dart';

class Triangle extends StatelessWidget {
  final double heightTriangle;
  const Triangle({super.key, required this.heightTriangle});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100.w, heightTriangle.h),
      painter: TrianglePainter(),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.redValorant
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
