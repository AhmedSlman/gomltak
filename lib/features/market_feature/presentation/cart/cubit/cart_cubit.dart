import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/market_feature/data/models/details_cart_model/product.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/cart_repo_impel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepoImpel) : super(CartInitial());
  CartRepoImpel cartRepoImpel;
  static CartCubit get(context) => BlocProvider.of(context);

  List<Product> listItemsCart = [];
  int? totlaPrice = 0;
  int? totlaPriceAdnDiscount = 0;
  int subTotalPrice = 0;
  int shipping = 0;
  int numberCounter = 1;

  Future addToCart({
    required int productId,
    required int productColorId,
    required int productSizeId,
    required int quantity,
  }) async {
    // emit(CartLoding());

    cartRepoImpel
        .addToCart(
      productId: productId,
      productColorId: productColorId,
      productSizeId: productSizeId,
      quantity: quantity,
    )
        .then((response) {
      response.fold(
          (faliure) => {emit(CartAddError(faliure.errMassage))},
          (success) => {
                emit(CartAddSuccess(success.message.toString())),
                getDetailsCart()
              });
    });
  }

  Future getDetailsCart() async {
    emit(CartLoding());
    print('aasdasdas');

    listItemsCart.clear();
    cartRepoImpel.getDetailsCart().then((response) {
      response.fold(
        (faliure) => {emit(CartGetProdactsToCartError())},
        (success) => {
          listItemsCart.addAll(success.products as Iterable<Product>),
          totlaPrice = success.total!,
          subTotalPrice = success.subTotal!,
          shipping = success.shipping!,
          emit(CartGetProdactsToCartSuccess()),
        },
      );
    });
  }

  Future<void> deleteAllProdactToCart() async {
    cartRepoImpel.deleteItemsToCart().then(
          (response) => response.fold(
            (faliure) => {getDetailsCart(), emit(CartDeleteError())},
            (success) => {
              totlaPrice = 0,
              subTotalPrice = 0,
              shipping = 0,
              getDetailsCart(),
              // emit(CartDeleteSuccess())
            },
          ),
        );
  }

  Future<void> getDiscountCart({
    required String couponNum,
  }) async {
    cartRepoImpel
        .getdiscountCart(
          couponNum: couponNum,
          totaPrice: totlaPrice!,
        )
        .then(
          (response) => response.fold(
              (faliure) => {emit(CartDiscountError())},
              (success) => {
                    totlaPrice = success.data!.totalPrice!,
                    emit(CartDiscountSuccess()),
                    totlaPrice = success.data!.totalPrice!,
                  }),
        );
  }
}



// Future<void> plusItemNumber(index) async {
//   emit(CartCountLoding());
//   // listItemsCart[index].count++;
//   emit(CartCountLoded());
// }

// void minusItemNumber(index) async {
//   emit(CartCountLoding());
//   // if (listItemsCart[index].count != 1) {
//   //   listItemsCart[index].count--;
//   // } else {
//   //   listItemsCart.removeAt(index);
//   // }
//   emit(CartCountLoded());
// }
