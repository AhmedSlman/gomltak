import 'data.dart';

class ForgetPassword {
  int? status;
  String? message;
  Data? data;

  ForgetPassword({this.status, this.message, this.data});

  factory ForgetPassword.fromJson(Map<String, dynamic> json) => ForgetPassword(
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
