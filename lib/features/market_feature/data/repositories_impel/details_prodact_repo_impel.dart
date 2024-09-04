// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/details_prodact_model/details_prodact_model.dart';
import 'package:gomltak/features/market_feature/data/models/review_model/review_model.dart';
import 'package:gomltak/features/market_feature/data/repositories/details_prodact_repo.dart';

class DetailsProdactRepoImpel implements DetailsProdactRepo {
  final ApiServes apiServes;
  DetailsProdactRepoImpel({
    required this.apiServes,
  });
  @override
  Future<Either<Failure, DetailsProdactModel>> fetchDetailsProdact({
    required int idProdact,
  }) async {
    try {
      final resposn = await apiServes.get(
          endpoint: 'get-product',
          lang: CachHelper.getData('lang').toString(),
          data: {'product_id': idProdact});

      if (resposn['status'] == 1) {
        return right(DetailsProdactModel.fromJson(resposn));
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
  Future<Either<Failure, ReviewModel>> addReviewToProdact({
    required String token,
    required String review,
    required String rate,
    required int productId,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'make-review',
        data: {
          'rate': rate,
          'review': review,
          'product_id': productId,
        },
        token: token,
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(ReviewModel.fromJson(resposn));
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
