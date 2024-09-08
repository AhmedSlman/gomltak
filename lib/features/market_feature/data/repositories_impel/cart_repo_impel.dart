// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/coupun_model/coupun_model.dart';
import 'package:gomltak/features/market_feature/data/models/create_cart_model/create_cart_model.dart';
import 'package:gomltak/features/market_feature/data/models/details_cart_model/details_cart_model.dart';

import '../repositories/cart_repo.dart';

class CartRepoImpel implements CartRepo {
  ApiServes apiServes;
  CartRepoImpel({
    required this.apiServes,
  });
  @override
  Future<Either<Failure, CreateCartModel>> addToCart({
    required int productId,
    required int productColorId,
    required int productSizeId,
    required int quantity,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'create-cart',
        data: {
          'product_id': productId,
          'product_color_id': productColorId,
          'product_size_id': productSizeId,
          'quantity': quantity,
        },
        token: CachHelper.getData('token').toString(),
        lang: CachHelper.getData('lang').toString(),
      );
//print(resposn);
      if (resposn['status'] == 1) {
        if (resposn['data'] == null) {
          return left(ServerFailure(resposn['message']));
        } else {
          return right(CreateCartModel.fromJson(resposn));
        }
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
  Future<Either<Failure, DetailsCartModel>> getDetailsCart() async {
    try {
      final resposn = await apiServes.get(
        endpoint: 'create-details',
        token: CachHelper.getData('token').toString(),
        lang: CachHelper.getData('lang').toString(),
      );
      print(resposn);

      if (resposn['key'] == 'succes') {
        return right(DetailsCartModel.fromJson(resposn));
      } else {
        print(resposn);
        return left(ServerFailure(resposn['msg']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteItemsToCart({
    String? type,
    int? productId,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'delete-item-cart',
        token: CachHelper.getData('token').toString(),
        lang: CachHelper.getData('lang').toString(),
        data: {
          'type': type,
          'product_id': productId,
        },
      );

      return right('${resposn['message']}');
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, CoupunModel>> getdiscountCart({
    required String couponNum,
    required int totaPrice,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'coupon',
        token: CachHelper.getData('token').toString(),
        lang: CachHelper.getData('lang').toString(),
        data: {
          'coupon_num': couponNum,
          'total_price': totaPrice,
        },
      );

      if (resposn['key'] == 'success') {
        // print('===========================${resposn}');
        // print('===========================${resposn}');
        return right(CoupunModel.fromJson(resposn));
      } else {
        // print('${resposn}=====================================');
        // print('${resposn}=====================================');
        return left(ServerFailure(resposn['msg']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }
}
