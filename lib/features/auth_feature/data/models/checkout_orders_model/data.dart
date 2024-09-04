class Data {
  String? firstName;
  String? lastName;
  String? companyName;
  int? governorateId;
  String? address;
  String? city;
  String? countryState;
  String? postCode;
  String? phone;
  String? email;
  String? notes;
  int? clientId;
  int? totalAfterDisc;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  int? subTotal;
  int? total;

  Data({
    this.firstName,
    this.lastName,
    this.companyName,
    this.governorateId,
    this.address,
    this.city,
    this.countryState,
    this.postCode,
    this.phone,
    this.email,
    this.notes,
    this.clientId,
    this.totalAfterDisc,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.subTotal,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        companyName: json['company_name'] as String?,
        governorateId: json['governorate_id'] as int?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        countryState: json['country_state'] as String?,
        postCode: json['post_code'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        notes: json['notes'] as String?,
        clientId: json['client_id'] as int?,
        totalAfterDisc: json['total_after_disc'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
        subTotal: json['sub_total'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'company_name': companyName,
        'governorate_id': governorateId,
        'address': address,
        'city': city,
        'country_state': countryState,
        'post_code': postCode,
        'phone': phone,
        'email': email,
        'notes': notes,
        'client_id': clientId,
        'total_after_disc': totalAfterDisc,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'sub_total': subTotal,
        'total': total,
      };
}
