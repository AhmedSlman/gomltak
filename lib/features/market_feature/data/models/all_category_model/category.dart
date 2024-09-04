import 'package:equatable/equatable.dart';

import 'sub_category.dart';

class Category extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final List<SubCategory>? subCategory;

  const Category({
    this.id,
    this.title,
    this.description,
    this.image,
    this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        subCategory: (json['subCategory'] as List<dynamic>?)
            ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'subCategory': subCategory?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, title, description, image, subCategory];
}
