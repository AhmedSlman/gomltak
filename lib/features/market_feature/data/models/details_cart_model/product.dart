import 'data.dart';

class Product {
  Data? data;

  Product({this.data});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
