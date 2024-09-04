import 'package:flutter/material.dart';

class ClipItems extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.1578947);
    path0.quadraticBezierTo(size.width * 0.0001250, size.height * 0.0789474,
        size.width * 0.0375000, size.height * 0.0315789);
    path0.quadraticBezierTo(size.width * 0.1020000, size.height * -0.0114737,
        size.width * 0.1875000, 0);
    path0.lineTo(size.width * 0.8125000, 0);
    path0.quadraticBezierTo(size.width * 0.8823125, size.height * -0.0045263,
        size.width * 0.9500000, size.height * 0.0315789);
    path0.quadraticBezierTo(size.width * 1.0116875, size.height * 0.0660526,
        size.width, size.height * 0.1526316);
    path0.lineTo(size.width, size.height * 0.8421053);
    path0.quadraticBezierTo(size.width * 1.0091250, size.height * 0.9371053,
        size.width * 0.9687500, size.height * 0.9736842);
    path0.quadraticBezierTo(size.width * 0.9165000, size.height * 1.0097895,
        size.width * 0.8187500, size.height);
    path0.quadraticBezierTo(size.width * 0.7805937, size.height,
        size.width * 0.7678750, size.height);
    path0.cubicTo(
        size.width * 0.6273750,
        size.height * 1.0138421,
        size.width * 0.6911250,
        size.height * 0.8447368,
        size.width * 0.5030000,
        size.height * 0.8424211);
    path0.cubicTo(
        size.width * 0.3107500,
        size.height * 0.8457895,
        size.width * 0.3807500,
        size.height * 1.0184737,
        size.width * 0.2299375,
        size.height);
    path0.quadraticBezierTo(size.width * 0.2177656, size.height,
        size.width * 0.1812500, size.height);
    path0.quadraticBezierTo(size.width * 0.0865000, size.height * 1.0099474,
        size.width * 0.0312500, size.height * 0.9736842);
    path0.quadraticBezierTo(size.width * -0.0075625, size.height * 0.9250526, 0,
        size.height * 0.8421053);
    path0.lineTo(0, size.height * 0.1578947);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
