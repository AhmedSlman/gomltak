import 'package:dartz/dartz.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/coupun_model/coupun_model.dart';
import 'package:gomltak/features/market_feature/data/models/create_cart_model/create_cart_model.dart';
import 'package:gomltak/features/market_feature/data/models/details_cart_model/details_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CreateCartModel>> addToCart({
    required int productId,
    required int productColorId,
    required int productSizeId,
    required int quantity,
  });
  Future<Either<Failure, DetailsCartModel>> getDetailsCart();
  Future<Either<Failure, String>> deleteItemsToCart({
    String? type,
    int? productId,
  });
  Future<Either<Failure, CoupunModel>> getdiscountCart({
    required String couponNum,
    required int totaPrice,
  });
}
