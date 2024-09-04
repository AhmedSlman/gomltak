import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String? name;
  final String? review;
  final int? rate;
  final String? createdAt;

  const Review({this.name, this.review, this.rate, this.createdAt});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json['name'] as String?,
        review: json['review'] as String?,
        rate: json['rate'] as int?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'rate': rate,
        'created_at': createdAt,
      };

  @override
  List<Object?> get props => [name, review, rate, createdAt];
}
