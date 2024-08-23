import 'package:flutter/material.dart';

class CloudyBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path pathOne = Path();
    pathOne.moveTo(size.width * 0.9945470, size.height * 0.9747818);
    pathOne.lineTo(size.width * 0.006917318, size.height * 0.9747818);
    pathOne.cubicTo(
        size.width * 0.006917318,
        size.height * 0.9747818,
        size.width * 0.1421735,
        size.height * 0.06970773,
        size.width * 0.2868242,
        size.height * 0.01310464);
    pathOne.cubicTo(
        size.width * 0.4314742,
        size.height * -0.04349832,
        size.width * 0.5006833,
        size.height * 0.6854455,
        size.width * 0.5006833,
        size.height * 0.6854455);
    pathOne.cubicTo(
        size.width * 0.5006833,
        size.height * 0.6854455,
        size.width * 0.5939545,
        size.height * 0.4277141,
        size.width * 0.6673818,
        size.height * 0.4277141);
    pathOne.cubicTo(
        size.width * 0.7408091,
        size.height * 0.4277141,
        size.width * 0.7973652,
        size.height * 0.7670455,
        size.width * 0.7973652,
        size.height * 0.7670455);
    pathOne.cubicTo(
        size.width * 0.7973652,
        size.height * 0.7670455,
        size.width * 0.9441242,
        size.height * 0.5346000,
        size.width * 0.9944500,
        size.height * 0.9744909);
    pathOne.lineTo(size.width * 0.9945470, size.height * 0.9747818);
    pathOne.close();

    Paint paintOne = Paint()..style = PaintingStyle.fill;
    paintOne.color = const Color(0xff161616).withOpacity(0.13);
    canvas.drawPath(pathOne, paintOne);
  }

  @override
  bool shouldRepaint(CloudyBackground oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CloudyBackground oldDelegate) => false;
}
