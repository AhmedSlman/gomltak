// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeFetchAllProdactsError extends HomeState {}

class HomeFetchAllProdactsSuccess extends HomeState {}

class HomeFetchAllProdactsLoding extends HomeState {}

class HomeFetchOffersError extends HomeState {}

class HomeFetchOffersSuccess extends HomeState {}

class HomeFetchOffersLoding extends HomeState {}

class GetAllCategoryError extends HomeState {}

class GetAllCategorySuccess extends HomeState {}

class GetAllCategoryLoding extends HomeState {}
