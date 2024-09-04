import 'package:equatable/equatable.dart';

class ColorProdacts extends Equatable {
  final int? id;
  final String? color;

  const ColorProdacts({this.id, this.color});

  factory ColorProdacts.fromJson(Map<String, dynamic> json) => ColorProdacts(
        id: json['id'] as int?,
        color: json['color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'color': color,
      };

  @override
  List<Object?> get props => [id, color];

  replaceAll(String s, String t) {}
}
