import 'package:equatable/equatable.dart';

class Color extends Equatable {
  final int? id;
  final String? color;

  const Color({this.id, this.color});

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json['id'] as int?,
        color: json['color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'color': color,
      };

  @override
  List<Object?> get props => [id, color];
}
