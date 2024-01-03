import 'package:punk/domain/entities/hops.dart';
import 'package:punk/domain/entities/malt.dart';

class Ingredient {
  final List<Malt>? malt;
  final List<Hops>? hops;
  final String? yeast;

  Ingredient({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      malt: json['malt'] != null ? List.from(json['malt']).map((e) => Malt.fromJson(e as Map<String, dynamic>)).toList() : null,
      hops: json['hops'] != null ? List.from(json['hops']).map((e) => Hops.fromJson(e as Map<String, dynamic>)).toList() : null,
      yeast: json['yeast'] != null ? json['yeast'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['malt'] = malt?.map((e) => e.toJson()).toList();
    data['hops'] = hops?.map((e) => e.toJson()).toList();
    data['yeast'] = yeast;
    return data;
  }
}
