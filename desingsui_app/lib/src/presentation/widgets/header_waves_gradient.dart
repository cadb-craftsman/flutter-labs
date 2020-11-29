import 'package:flutter/material.dart';

class HeaderWavesGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavesGradientPainter()),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 150.0),
      radius: 180,
    );

    final Gradient gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
        stops: [
          0.0,
          0.5,
          1.0
        ]);

    final paint = new Paint()..shader = gradient.createShader(rect);

    paint.color = Color(0xff615AAB);
    //paint.style = PaintingStyle.stroke; //stroke, fill
    paint.style = PaintingStyle.fill; //stroke, fill
    paint.strokeWidth = 5;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.40);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.50,
        size.width * 0.50, size.height * 0.40);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.30, size.width, size.height * 0.40);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
