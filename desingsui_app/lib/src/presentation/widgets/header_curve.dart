import 'package:flutter/material.dart';

class HeaderCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvePainter()),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Color(0xff615AAB);
    //paint.style = PaintingStyle.stroke; //stroke, fill
    paint.style = PaintingStyle.fill; //stroke, fill
    paint.strokeWidth = 5;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.50, size.height * 0.50, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
