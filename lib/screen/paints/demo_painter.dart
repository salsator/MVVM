import 'package:flutter/cupertino.dart';

class DemoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var center = size/2;
    var paint = Paint()..color = const Color.fromRGBO(255, 212, 7, 1.0);
    canvas.drawArc(Rect.fromCenter(
        center: Offset(
            center.width,
            center.height),
        width: 250,
        height: 250),
    0.4,
    2*3.14-0.8,
    true,
    paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return false;
  }

}