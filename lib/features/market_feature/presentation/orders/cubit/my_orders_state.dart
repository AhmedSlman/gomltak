part of 'my_orders_cubit.dart';

abstract class MyOrdersState extends Equatable {
  const MyOrdersState();

  @override
  List<Object> get props => [];
}

class MyOrdersInitial extends MyOrdersState {}

class MyOrdersError extends MyOrdersState {}

class MyOrdersSuccess extends MyOrdersState {}
