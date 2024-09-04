import 'package:gomltak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Positioned shadowInOnpoirding() {
  return Positioned.fill(
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.kRGPCeladonGreen,
            AppColors.mainColor,
          ],
          stops: [
            0.1577,
            1.0,
          ],
        ),
      ),
    ),
  );
}
