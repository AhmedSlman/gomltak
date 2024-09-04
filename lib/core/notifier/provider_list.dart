import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/core/service_locator/services_locator.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';
import 'package:gomltak/features/auth_feature/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/cart_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/category_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/home_repo_impel.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cubit/cart_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/home/cubit/home_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    BlocProvider<ForgetPasswordCubit>(
        create: (context) => ForgetPasswordCubit(sl.get<AuthRepoImpel>())),
    BlocProvider<CartCubit>(
        create: (context) =>
            CartCubit(sl.get<CartRepoImpel>())..getDetailsCart()),
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        sl.get<HomeRepoImpel>(),
        sl.get<CategoryRepoImpel>(),
      )
        ..fetchAllCategory()
        ..fetchProdacts()
        ..fetchOffers(),
    ),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
