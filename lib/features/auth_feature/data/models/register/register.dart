import 'package:equatable/equatable.dart';

import 'data.dart';

class Register extends Equatable {
  final int? status;
  final String? message;
  final RegisterData? data;

  const Register({
    this.status,
    this.message,
    this.data,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        // 'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [
        status,
        message,
        // data,
      ];
}
