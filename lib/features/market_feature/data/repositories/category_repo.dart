import 'package:dartz/dartz.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/all_category_model/all_category_model.dart';

import '../models/prodactes_by_category/prodactes_by_category.dart';

abstract class CategoryRepo {
  Future<Either<Failure, ProdactesByCategory>> fetchProdactesByCategory(
      {required int idcategory});
  Future<Either<Failure, AllCategoryModel>> fetchAllCategory({int categoryId});
}
