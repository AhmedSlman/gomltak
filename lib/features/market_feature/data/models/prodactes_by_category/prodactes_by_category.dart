import 'package:equatable/equatable.dart';

import 'data.dart';

class ProdactesByCategory extends Equatable {
  final int? status;
  final String? message;
  final Data? data;

  const ProdactesByCategory({this.status, this.message, this.data});

  factory ProdactesByCategory.fromJson(Map<String, dynamic> json) {
    return ProdactesByCategory(
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
