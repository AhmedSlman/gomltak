import 'package:dartz/dartz.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/details_prodact_model/details_prodact_model.dart';
import 'package:gomltak/features/market_feature/data/models/review_model/review_model.dart';

abstract class DetailsProdactRepo {
  Future<Either<Failure, DetailsProdactModel>> fetchDetailsProdact({
    required int idProdact,
  });
  Future<Either<Failure, ReviewModel>> addReviewToProdact({
    required String token,
    required String review,
    required String rate,
    required int productId,
  });
}
