// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/all_prodacts_model/all_prodacts_model.dart';
import 'package:gomltak/features/market_feature/data/models/offers_model/offers_model.dart';
import 'package:gomltak/features/market_feature/data/repositories/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final ApiServes apiServes;
  HomeRepoImpel({
    required this.apiServes,
  });

  @override
  Future<Either<Failure, OffersModel>> fetchAllOffers() async {
    try {
      final resposn = await apiServes.get(
        endpoint: 'offers',
        lang: CachHelper.getData('lang').toString(),
      );
      //print(resposn.toString());
      if (resposn['status'] == 1) {
        return right(OffersModel.fromJson(resposn));
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

  @override
  Future<Either<Failure, AllProdactsModel>> fetchAllPordacts({
    required int pageId,
  }) async {
    try {
      final resposn = await apiServes.get(
          endpoint: 'all-products',
          lang: CachHelper.getData('lang').toString(),
          data: {
            'page': pageId,
          });

      if (resposn['status'] == 1) {
        return right(AllProdactsModel.fromJson(resposn));
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
