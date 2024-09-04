import 'package:flutter/material.dart';

Positioned backgroundImageInOnpording({
  required String image,
}) {
  return Positioned.fill(
    child: Image.asset(
      image,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
    ),
  );
}
