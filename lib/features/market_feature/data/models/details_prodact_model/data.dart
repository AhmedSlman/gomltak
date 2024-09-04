import 'package:equatable/equatable.dart';

import 'poducts.dart';

class Data extends Equatable {
  final Poducts? poducts;

  const Data({this.poducts});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        poducts: json['poducts'] == null
            ? null
            : Poducts.fromJson(json['poducts'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'poducts': poducts?.toJson(),
      };

  @override
  List<Object?> get props => [poducts];
}
