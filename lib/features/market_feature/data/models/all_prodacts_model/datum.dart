import 'package:equatable/equatable.dart';

import 'color.dart';

class Datum extends Equatable {
  final num? id;
  final String? title;
  final String? category;
  final num? originalPrice;
  final num? sellingPrice;
  final num? rate;
  final String? image;
  final List<ColorProdacts>? colors;

  const Datum({
    this.id,
    this.title,
    this.category,
    this.originalPrice,
    this.sellingPrice,
    this.rate,
    this.image,
    this.colors,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as num?,
        title: json['title'] as String?,
        category: json['category'] as String?,
        originalPrice: json['original_price'] as num?,
        sellingPrice: json['selling_price'] as num?,
        rate: json['rate'] as num?,
        image: json['image'] as String?,
        colors: (json['colors'] as List<dynamic>?)
            ?.map((e) => ColorProdacts.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'original_price': originalPrice,
        'selling_price': sellingPrice,
        'rate': rate,
        'image': image,
        'colors': colors?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      category,
      originalPrice,
      sellingPrice,
      rate,
      image,
      colors,
    ];
  }
}
