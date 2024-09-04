import 'data.dart';

class CheckoutOrdersModel {
  int? status;
  String? message;
  Data? data;

  CheckoutOrdersModel({this.status, this.message, this.data});

  factory CheckoutOrdersModel.fromJson(Map<String, dynamic> json) {
    return CheckoutOrdersModel(
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
