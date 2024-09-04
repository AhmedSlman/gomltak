import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/cart_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/category_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/details_prodact_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/home_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/my_orders_repo_impel.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<ApiServes>(() => ApiServes(sl.get<Dio>()));

    // repo imoerl =========>>
    sl.registerLazySingleton<HomeRepoImpel>(
        () => HomeRepoImpel(apiServes: sl.get<ApiServes>()));
    sl.registerLazySingleton<CategoryRepoImpel>(
        () => CategoryRepoImpel(apiServes: sl.get<ApiServes>()));
    sl.registerLazySingleton<AuthRepoImpel>(
        () => AuthRepoImpel(apiServes: sl.get<ApiServes>()));
    sl.registerLazySingleton<DetailsProdactRepoImpel>(
        () => DetailsProdactRepoImpel(apiServes: sl.get<ApiServes>()));
    sl.registerLazySingleton<MyOrdersRepoImpel>(
        () => MyOrdersRepoImpel(sl.get<ApiServes>()));
    sl.registerLazySingleton<CartRepoImpel>(
        () => CartRepoImpel(apiServes: sl.get<ApiServes>()));
  }
}
