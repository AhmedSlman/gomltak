import 'client.dart';

class LoginModelData {
  String? token;
  Client? client;

  LoginModelData({this.token, this.client});

  factory LoginModelData.fromJson(Map<String, dynamic> json) => LoginModelData(
        token: json['token'] as String?,
        client: json['client'] == null
            ? null
            : Client.fromJson(json['client'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'client': client?.toJson(),
      };
}
