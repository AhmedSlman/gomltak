import 'package:dartz/dartz.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/market_feature/data/models/my_orders_model/my_orders_model.dart';

abstract class MyOrdersRepo {
  Future<Either<Failure, MyOrdersModel>> fetchAllOrders();
}
