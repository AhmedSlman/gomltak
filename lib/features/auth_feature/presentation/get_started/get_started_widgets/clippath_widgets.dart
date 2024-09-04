import 'package:flutter/material.dart';

class ClipInGetStarted extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.1566265, size.height * 0.0024272);
    path0.lineTo(size.width * 0.8632530, 0);
    path0.quadraticBezierTo(size.width * 1.0076807, size.height * 0.0094660,
        size.width * 0.9915663, size.height * 0.1150485);
    path0.cubicTo(
        size.width * 0.9742771,
        size.height * 0.2973301,
        size.width * 0.9270030,
        size.height * 0.7102973,
        size.width * 0.9054819,
        size.height * 0.9087136);
    path0.quadraticBezierTo(size.width * 0.8924096, size.height * 1.0014320,
        size.width * 0.7664157, size.height);
    path0.lineTo(size.width * 0.2573193, size.height);
    path0.quadraticBezierTo(size.width * 0.1217470, size.height * 0.9940049,
        size.width * 0.0926205, size.height * 0.9039806);
    path0.cubicTo(
        size.width * 0.0718373,
        size.height * 0.7091019,
        size.width * 0.0320783,
        size.height * 0.3069660,
        size.width * 0.0094880,
        size.height * 0.1244660);
    path0.quadraticBezierTo(size.width * -0.0163855, size.height * -0.0050728,
        size.width * 0.1566265, size.height * 0.0024272);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
