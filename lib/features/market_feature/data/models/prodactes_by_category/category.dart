import 'package:equatable/equatable.dart';

import 'products.dart';

class Category extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final Products? products;

  const Category({
    this.id,
    this.title,
    this.description,
    this.image,
    this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        products: json['products'] == null
            ? null
            : Products.fromJson(json['products'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'products': products?.toJson(),
      };

  @override
  List<Object?> get props => [id, title, description, image, products];
}
