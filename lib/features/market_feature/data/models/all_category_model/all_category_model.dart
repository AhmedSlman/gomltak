import 'package:equatable/equatable.dart';

import 'data.dart';

class AllCategoryModel extends Equatable {
  final int? status;
  final String? message;
  final Data? data;

  const AllCategoryModel({this.status, this.message, this.data});

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) {
    return AllCategoryModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
