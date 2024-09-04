import 'coupon.dart';

class Data {
  int? discAmount;
  int? totalPrice;
  Coupon? coupon;

  Data({this.discAmount, this.totalPrice, this.coupon});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        discAmount: json['disc_amount'] as int?,
        totalPrice: json['total_price'] as int?,
        coupon: json['coupon'] == null
            ? null
            : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'disc_amount': discAmount,
        'total_price': totalPrice,
        'coupon': coupon?.toJson(),
      };
}
