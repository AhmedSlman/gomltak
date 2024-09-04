class Client {
  int? id;
  String? userName;
  String? email;
  String? pinCode;
  int? status;
  int? governorateId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Client({
    this.id,
    this.userName,
    this.email,
    this.pinCode,
    this.status,
    this.governorateId,
    this.createdAt,
    this.updatedAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'] as int?,
        userName: json['user_name'] as String?,
        email: json['email'] as String?,
        pinCode: json['pin_code'] as String?,
        status: json['status'] as int?,
        governorateId: json['governorate_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_name': userName,
        'email': email,
        'pin_code': pinCode,
        'status': status,
        'governorate_id': governorateId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
