class Data {
  int? id;
  String? title;
  String? desc;
  String? image;
  int? price;
  int? quantity;
  int? subTotal;

  Data({
    this.id,
    this.title,
    this.desc,
    this.image,
    this.price,
    this.quantity,
    this.subTotal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        title: json['title'] as String?,
        desc: json['desc'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        subTotal: json['sub_total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'image': image,
        'price': price,
        'quantity': quantity,
        'sub_total': subTotal,
      };
}
