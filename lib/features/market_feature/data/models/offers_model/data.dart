import 'package:equatable/equatable.dart';

import 'offer.dart';

class Data extends Equatable {
  final List<Offer>? offers;

  const Data({this.offers});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offers: (json['offers'] as List<dynamic>?)
            ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'offers': offers?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [offers];
}
