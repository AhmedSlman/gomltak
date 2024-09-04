import 'package:equatable/equatable.dart';

class SizeProdactDetails extends Equatable {
  final int? id;
  final String? size;

  const SizeProdactDetails({this.id, this.size});

  factory SizeProdactDetails.fromJson(Map<String, dynamic> json) =>
      SizeProdactDetails(
        id: json['id'] as int?,
        size: json['size'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'size': size,
      };

  @override
  List<Object?> get props => [id, size];
}
