import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/features/market_feature/data/models/details_prodact_model/poducts.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/details_prodact_repo_impel.dart';

import 'details_prodact_state.dart';

class DetailsProdactCubit extends Cubit<DetailsProdactState> {
  DetailsProdactRepoImpel detailsProdactRepoImpel;

  DetailsProdactCubit(this.detailsProdactRepoImpel)
      : super(DetailsProdactInitial());
  static DetailsProdactCubit get(context) => BlocProvider.of(context);
  late Poducts poducts;
  dynamic averageRating;
  int numberCounter = 1;
  int? selectedSizeId;
  int? selectedColorId;
  String userName = CachHelper.getData('userName').toString();

  Future<void> fetchDetailsProdact({required int idProdact}) async {
    emit(DetailsProdactLoding());
    detailsProdactRepoImpel
        .fetchDetailsProdact(idProdact: idProdact)
        .then((response) {
      response.fold(
        (failure) => emit(DetailsProdactError(failure.errMassage)),
        (success) {
          poducts = success.data?.poducts as Poducts;
          getAvarage();
          emit(DetailsProdactSuccess());
        },
      );
    });
  }

  Future<void> addReviewToProdact({
    required String token,
    required String review,
    required String rate,
    required int productId,
  }) async {
    detailsProdactRepoImpel
        .addReviewToProdact(
      token: token,
      review: review,
      rate: rate,
      productId: productId,
    )
        .then((response) {
      response.fold(
        (failure) => emit(DetailsProdactError(failure.errMassage)),
        (success) {
          getAvarage();
          emit(DetailsProdactSuccess());
        },
      );
    });
  }

  Future<void> getAvarage() async {
    try {
      int? totalRating = poducts.reviews!
          .map((reviews) => reviews.rate)
          .reduce((total, review) => total);
      averageRating = totalRating! / poducts.reviews!.length;
    } catch (e) {}
    // const averageRating = totalRating / state.products?.reviews?.length || 0;
  }

  Future<void> plusItemNumber() async {
    emit(DetailsProdactCountLoding());
    numberCounter++;
    emit(DetailsProdactCountlodid());
  }

  void minusItemNumber() async {
    emit(DetailsProdactCountLoding());

    if (numberCounter != 1) {
      numberCounter--;
    }

    emit(DetailsProdactCountlodid());
  }
}
