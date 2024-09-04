import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int? governorateId;
  final String? userName;
  final String? email;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const Client({
    this.governorateId,
    this.userName,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        governorateId: json['governorate_id'] as int?,
        userName: json['user_name'] as String?,
        email: json['email'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'governorate_id': governorateId,
        'user_name': userName,
        'email': email,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      governorateId,
      userName,
      email,
      updatedAt,
      createdAt,
      id,
    ];
  }
}
