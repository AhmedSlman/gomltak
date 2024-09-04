import 'data.dart';

class CoupunModel {
  String? msg;
  String? key;
  Data? data;

  CoupunModel({this.msg, this.key, this.data});

  factory CoupunModel.fromJson(Map<String, dynamic> json) => CoupunModel(
        msg: json['msg'] as String?,
        key: json['key'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'key': key,
        'data': data?.toJson(),
      };
}
