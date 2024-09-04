import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final int? id;
  final int? categoryId;
  final String? title;
  final String? description;
  final String? image;

  const SubCategory({
    this.id,
    this.categoryId,
    this.title,
    this.description,
    this.image,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json['id'] as int?,
        categoryId: json['category_id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'title': title,
        'description': description,
        'image': image,
      };

  @override
  List<Object?> get props => [id, categoryId, title, description, image];
}
