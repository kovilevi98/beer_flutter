import 'package:punk/data/models/hops_dto.dart';
import 'package:punk/data/models/malt_dto.dart';

class IngredientDTO {
  final List<MaltDTO>? malt;
  final List<HopsDTO>? hops;
  final String? yeast;

  IngredientDTO({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  factory IngredientDTO.fromJson(Map<String, dynamic> json) {
    return IngredientDTO(
      malt: json['malt'] != null ? List.from(json['malt']).map((e) => MaltDTO.fromJson(e as Map<String, dynamic>)).toList() : null,
      hops: json['hops'] != null ? List.from(json['hops']).map((e) => HopsDTO.fromJson(e as Map<String, dynamic>)).toList() : null,
      yeast: json['yeast'] != null ? json['yeast'] as String : null,
    );
  }
}
