part of 'category_cubit.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoryLoding extends CategoryState {}

class CategoryError extends CategoryState {}

class CategorySuccess extends CategoryState {}
