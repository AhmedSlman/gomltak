class Review {
  String? rate;
  String? review;
  int? productId;
  int? clientId;
  String? name;
  String? email;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Review({
    this.rate,
    this.review,
    this.productId,
    this.clientId,
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rate: json['rate'] as String?,
        review: json['review'] as String?,
        productId: json['product_id'] as int?,
        clientId: json['client_id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'review': review,
        'product_id': productId,
        'client_id': clientId,
        'name': name,
        'email': email,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
