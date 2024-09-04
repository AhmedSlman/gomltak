import 'data.dart';

class CreateCartModel {
  int? status;
  String? message;
  Data? data;

  CreateCartModel({this.status, this.message, this.data});

  factory CreateCartModel.fromJson(Map<String, dynamic> json) {
    return CreateCartModel(
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
}
