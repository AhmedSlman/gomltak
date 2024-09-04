import 'package:equatable/equatable.dart';

import 'color.dart';
import 'review.dart';
import 'size.dart';

class Poducts extends Equatable {
  final int? id;
  final String? title;
  final String? category;
  final int? originalPrice;
  final int? sellingPrice;
  final num? avgRate;
  final String? image;
  final String? desc;
  final List<ColorPoducts>? colors;
  final List<SizeProdactDetails>? sizes;
  final List<Review>? reviews;

  const Poducts({
    this.id,
    this.title,
    this.category,
    this.originalPrice,
    this.sellingPrice,
    this.avgRate,
    this.image,
    this.desc,
    this.colors,
    this.sizes,
    this.reviews,
  });

  factory Poducts.fromJson(Map<String, dynamic> json) => Poducts(
        id: json['id'] as int?,
        title: json['title'] as String?,
        category: json['category'] as String?,
        originalPrice: json['original_price'] as int?,
        sellingPrice: json['selling_price'] as int?,
        image: json['image'] as String?,
        avgRate: json['avg_rate'] as num?,
        desc: json['desc'] as String?,
        colors: (json['colors'] as List<dynamic>?)
            ?.map((e) => ColorPoducts.fromJson(e as Map<String, dynamic>))
            .toList(),
        sizes: (json['sizes'] as List<dynamic>?)
            ?.map((e) => SizeProdactDetails.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'original_price': originalPrice,
        'selling_price': sellingPrice,
        'avg_rate': avgRate,
        'image': image,
        'desc': desc,
        'colors': colors?.map((e) => e.toJson()).toList(),
        'sizes': sizes?.map((e) => e.toJson()).toList(),
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      category,
      originalPrice,
      sellingPrice,
      avgRate,
      image,
      desc,
      colors,
      sizes,
      reviews,
    ];
  }
}
