import 'package:equatable/equatable.dart';

import 'products.dart';

class Data extends Equatable {
  final Products? products;

  const Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: json['products'] == null
            ? null
            : Products.fromJson(json['products'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.toJson(),
      };

  @override
  List<Object?> get props => [products];
}
