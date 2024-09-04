import 'product.dart';

class Datum {
  int? orderId;
  Product? product;

  Datum({this.orderId, this.product});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json['order_id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'product': product?.toJson(),
      };
}
