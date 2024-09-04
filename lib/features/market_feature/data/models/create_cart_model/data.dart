class Data {
  // String? productId;
  // String? productColorId;
  // String? productSizeId;
  // String? quantity;
  // int? clientId;
  // int? price;
  // int? subTotal;
  // int? categoryId;
  // DateTime? updatedAt;
  // DateTime? createdAt;
  int? id;

  Data({
    // this.productId,
    // this.productColorId,
    // this.productSizeId,
    // this.quantity,
    // this.clientId,
    // this.price,
    // this.subTotal,
    // this.categoryId,
    // this.updatedAt,
    // this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        // productId: json['product_id'] as String?,
        // productColorId: json['product_color_id'] as String?,
        // productSizeId: json['product_size_id'] as String?,
        // quantity: json['quantity'] as String?,
        // clientId: json['client_id'] as int?,
        // price: json['price'] as int?,
        // subTotal: json['sub_total'] as int?,
        // categoryId: json['category_id'] as int?,
        // updatedAt: json['updated_at'] == null
        //     ? null
        //     : DateTime.parse(json['updated_at'] as String),
        // createdAt: json['created_at'] == null
        //     ? null
        //     : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        // 'product_id': productId,
        // 'product_color_id': productColorId,
        // 'product_size_id': productSizeId,
        // 'quantity': quantity,
        // 'client_id': clientId,
        // 'price': price,
        // 'sub_total': subTotal,
        // 'category_id': categoryId,
        // 'updated_at': updatedAt?.toIso8601String(),
        // 'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
