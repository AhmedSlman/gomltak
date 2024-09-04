import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;

  const Offer({this.id, this.title, this.description, this.image});

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
      };

  @override
  List<Object?> get props => [id, title, description, image];
}
