import 'package:dio/dio.dart';
import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/features/market_feature/data/models/my_orders_model/my_orders_model.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gomltak/features/market_feature/data/repositories/my_orders_repo.dart';

class MyOrdersRepoImpel implements MyOrdersRepo {
  ApiServes apiServes;
  MyOrdersRepoImpel(this.apiServes);
  @override
  Future<Either<Failure, MyOrdersModel>> fetchAllOrders() async {
    try {
      final resposn = await apiServes.get(
          endpoint: 'my-orders',
          lang: CachHelper.getData('lang').toString(),
          token: CachHelper.getData('token').toString());

      if (resposn['status'] == 1) {
        return right(MyOrdersModel.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }
}
