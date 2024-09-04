import 'package:equatable/equatable.dart';

import 'client.dart';

class RegisterData extends Equatable {
  final String? token;
  final Client? client;

  const RegisterData({this.token, this.client});

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        token: json['token'] as String?,
        client: json['client'] == null
            ? null
            : Client.fromJson(json['client'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'client': client?.toJson(),
      };

  @override
  List<Object?> get props => [token, client];
}
