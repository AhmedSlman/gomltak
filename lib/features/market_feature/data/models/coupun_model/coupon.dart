class Coupon {
  String? type;
  int? discount;
  int? id;

  Coupon({this.type, this.discount, this.id});

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        type: json['type'] as String?,
        discount: json['discount'] as int?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'discount': discount,
        'id': id,
      };
}
