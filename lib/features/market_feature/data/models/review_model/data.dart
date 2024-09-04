import 'review.dart';

class Data {
  Review? review;

  Data({this.review});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        review: json['review'] == null
            ? null
            : Review.fromJson(json['review'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'review': review?.toJson(),
      };
}
