import 'package:equatable/equatable.dart';

class ResentlyViewModel extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final int? originalPrice;
  final int? sellingPrice;

  const ResentlyViewModel(
      {this.id, this.title, this.image, this.originalPrice, this.sellingPrice});

  @override
  List<Object?> get props => [id, title, image, originalPrice, sellingPrice];

  // factory Category.fromJson(Map<String, dynamic> json) => Category(
  //       id: json['id'] as int?,
  //       title: json['title'] as String?,
  //       description: json['description'] as String?,
  //       image: json['image'] as String?,
  //     );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'title': title,
  //       'description': description,
  //       'image': image,
  //     };
}
