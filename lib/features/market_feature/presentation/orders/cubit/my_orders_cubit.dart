import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/market_feature/data/models/my_orders_model/product.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/my_orders_repo_impel.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.myOrdersRepoImpel) : super(MyOrdersInitial());
  static MyOrdersCubit get(context) => BlocProvider.of(context);
  MyOrdersRepoImpel myOrdersRepoImpel;
  List<Product> lsitMyOrders = [];
  Future<void> fetchAllOrders() async {
    myOrdersRepoImpel.fetchAllOrders().then((response) => response.fold(
          (failure) => {emit(MyOrdersError())},
          (success) => {
            success.data?.forEach((order) {
              lsitMyOrders.add(Product(
                date: order.product?.date,
                desc: order.product?.desc,
                image: order.product?.image,
                name: order.product?.name,
                price: order.product?.price,
                priceDex: order.product?.priceDex,
              ));
            }),
            emit(MyOrdersSuccess())
          },
        ));
  }
}
