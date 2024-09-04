// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/prodactes_by_category/prodactes_by_category.dart';
import 'package:gomltak/features/market_feature/data/repositories/category_repo.dart';

import '../models/all_category_model/all_category_model.dart';

class CategoryRepoImpel implements CategoryRepo {
  final ApiServes apiServes;
  CategoryRepoImpel({
    required this.apiServes,
  });
  @override
  Future<Either<Failure, AllCategoryModel>> fetchAllCategory({
    int? categoryId,
  }) async {
    try {
      print('resposn.toString()');

      final resposn = await apiServes
          .get(
        endpoint: 'categories',
        data: {'category_id': categoryId},
        lang: CachHelper.getData('lang').toString(),
      )
          .catchError((error) {
        print(error.toString());
      });
      print(resposn.toString());

      if (resposn['status'] == 1) {
        return right(AllCategoryModel.fromJson(resposn));
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
  Future<Either<Failure, ProdactesByCategory>> fetchProdactesByCategory(
      {required int idcategory}) async {
    try {
      final resposn = await apiServes.get(
        endpoint: 'products',
        data: {'sub_id': idcategory},
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(ProdactesByCategory.fromJson(resposn));
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
