import 'data.dart';

class ReviewModel {
  int? status;
  String? message;
  Data? data;

  ReviewModel({this.status, this.message, this.data});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
