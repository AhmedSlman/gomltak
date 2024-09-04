import 'package:equatable/equatable.dart';

class ColorPoducts extends Equatable {
  final int? id;
  final String? color;

  const ColorPoducts({this.id, this.color});

  factory ColorPoducts.fromJson(Map<String, dynamic> json) => ColorPoducts(
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
