import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;
  durationAndNavigator() {
    timer = Timer(const Duration(milliseconds: 500), () {
      bool? onPordingChick = CachHelper.getData("onPordingIsDone") as bool?;
      // String? token = CachHelper.getData("token") as String?;
      if (onPordingChick == true) {
        context.pushReplacement(
          // token == null
          //     ? AppRouterPath.loginView
          //     :
          AppRouterPath.bottomNavigationBarView,
        );
      } else {
        context.goRoute.pushReplacement(AppRouterPath.onpordingView);
      }
    });
  }

  @override
  void initState() {
    durationAndNavigator();

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/logo.jpg',
          width: context.width * .5,
        ),
      ),
    );
  }
}
