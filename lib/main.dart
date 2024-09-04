import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/service_locator/services_locator.dart';
import 'core/cached/cash_helper.dart';
import 'core/languages/language_manager.dart';
import 'core/utils/app_colors.dart';
import 'my_app.dart';

Future<void> main() async {
  await _init();
  runApp(
    EasyLocalization(
        supportedLocales: LanguageManager.listLanguageLocale,
        path: LanguageManager.pathLocalization,
        fallbackLocale: LanguageManager.englishLocale,
        child: Phoenix(
          child: const MyApp(),
        )),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _init() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  BindingBase.debugZoneErrorsAreFatal = true;
  await CachHelper.init();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.mainColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
}
