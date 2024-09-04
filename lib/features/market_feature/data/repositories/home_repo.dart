import 'package:dartz/dartz.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/all_prodacts_model/all_prodacts_model.dart';
import 'package:gomltak/features/market_feature/data/models/offers_model/offers_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, OffersModel>> fetchAllOffers();
  Future<Either<Failure, AllProdactsModel>> fetchAllPordacts({
    required int pageId,
  });
}
