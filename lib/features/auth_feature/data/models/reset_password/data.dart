class Data {
  int? pinCode;

  Data({this.pinCode});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pinCode: json['pin_code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pin_code': pinCode,
      };
}
