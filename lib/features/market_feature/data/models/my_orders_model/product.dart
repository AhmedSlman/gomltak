class Product {
  String? name;
  String? desc;
  String? image;
  int? price;
  int? priceDex;
  String? date;

  Product({
    this.name,
    this.desc,
    this.image,
    this.price,
    this.priceDex,
    this.date,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json['name'] as String?,
        desc: json['desc'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        priceDex: json['price_dex'] as int?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'desc': desc,
        'image': image,
        'price': price,
        'price_dex': priceDex,
        'date': date,
      };
}
