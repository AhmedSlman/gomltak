part of 'cart_cubit.dart';

abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class CartLoding extends CartState {}

class CartAddError extends CartState {
  CartAddError(this.errMassage);
  final String errMassage;
}

class CartAddSuccess extends CartState {
  CartAddSuccess(this.successMassage);
  final String successMassage;
}

class CartDeleteError extends CartState {}

class CartDeleteSuccess extends CartState {}

class CartGetProdactsToCartError extends CartState {}

class CartGetProdactsToCartSuccess extends CartState {}

class CartDiscountError extends CartState {}

class CartDiscountSuccess extends CartState {}
