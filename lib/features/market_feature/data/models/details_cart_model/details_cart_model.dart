import 'product.dart';

class DetailsCartModel {
  String? key;
  int? subTotal;
  int? shipping;
  int? total;
  List<Product>? products;

  DetailsCartModel({
    this.key,
    this.subTotal,
    this.shipping,
    this.total,
    this.products,
  });

  factory DetailsCartModel.fromJson(Map<String, dynamic> json) {
    return DetailsCartModel(
      key: json['key'] as String?,
      subTotal: json['sub_total'] as int?,
      shipping: json['shipping'] as int?,
      total: json['total'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'sub_total': subTotal,
        'shipping': shipping,
        'total': total,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
