import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/market_feature/data/models/all_category_model/sub_category.dart';
import 'package:gomltak/features/market_feature/data/models/prodactes_by_category/datum.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/category_repo_impel.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepoImpel) : super(CategoryInitial());
  CategoryRepoImpel categoryRepoImpel;
  static CategoryCubit get(context) => BlocProvider.of(context);
  List<Datum> categoryProdactes = [];
  List<SubCategory> listSubCategory = [];
  String categoryName = '';

  Future<void> fetchProdatesInSubCategory({required int idcategory}) async {
    emit(CategoryLoding());
    categoryRepoImpel
        .fetchProdactesByCategory(idcategory: idcategory)
        .then((resposne) {
      resposne.fold(
        (failure) => emit(CategoryError()),
        (success) {
          categoryProdactes.clear();
          categoryProdactes.addAll(
              success.data?.categories?[0].products?.data as Iterable<Datum>);
          categoryName = success.data!.categories![0].title!;
          emit(CategorySuccess());
        },
      );
    });
  }

  Future<void> fetchSubCategory({int? categoryId}) async {
    emit(CategoryLoding());
    await categoryRepoImpel
        .fetchAllCategory(categoryId: categoryId)
        .then((response) {
      response.fold(
        (failure) => emit(CategoryError()),
        (success) {
          listSubCategory.clear();
          listSubCategory.addAll(success.data?.categories?[0].subCategory
              as Iterable<SubCategory>);
          emit(CategorySuccess());
        },
      );
    });
  }
}
