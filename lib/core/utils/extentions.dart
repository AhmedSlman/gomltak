import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ImagePath on String {
  String get toPng => 'assets/image/$this.png';
  String get toSvg => 'assets/svg/$this.svg';
  String get toJpg => 'assets/image/$this.jpg';
}

extension Emptypadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension ThemeShortCuts on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  // ElevatedButtonThemeData get elevatedButtonTheme =>
  //     Theme.of(this).elevatedButtonTheme;
  ThemeData? get theme => Theme.of(this);
  // Color? get prinmaryColor => Theme.of(this).primaryColor.;
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

//GoRouter.of(context).push('/openBookView');
extension Routers on BuildContext {
  GoRouter get goRoute => GoRouter.of(this);
}
