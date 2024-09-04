import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cached/cash_helper.dart';
import 'core/service_locator/services_locator.dart';
import 'core/themes/light_theme.dart';
import 'core/utils/app_route.dart';
import 'features/auth_feature/data/repositories_impel/auth_repos_impel.dart';
import 'features/auth_feature/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'features/market_feature/data/repositories_impel/cart_repo_impel.dart';
import 'features/market_feature/data/repositories_impel/category_repo_impel.dart';
import 'features/market_feature/data/repositories_impel/home_repo_impel.dart';
import 'features/market_feature/presentation/cart/cubit/cart_cubit.dart';
import 'features/market_feature/presentation/home/cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ForgetPasswordCubit>(
                create: (context) =>
                    ForgetPasswordCubit(sl.get<AuthRepoImpel>())),
            BlocProvider<CartCubit>(
                create: (context) =>
                    CartCubit(sl.get<CartRepoImpel>())..getDetailsCart()),
            BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(
                  sl.get<HomeRepoImpel>(), sl.get<CategoryRepoImpel>())
                ..fetchAllCategory()
                ..fetchProdacts()
                ..fetchOffers()
                ..fetchPaginationProdacts(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              CachHelper.saveData(key: 'lang', value: locale.toString());
              return locale;
            },
            theme: themeData(),
            locale: context.locale,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    // textScaleFactor: 1.0,
                    ),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}
