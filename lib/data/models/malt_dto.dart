import 'package:punk/data/models/amount_dto.dart';

class MaltDTO {
  final String name;
  final AmountDTO value;

  MaltDTO({
    required this.name,
    required this.value,
  });

  factory MaltDTO.fromJson(Map<String, dynamic> json) {
    return MaltDTO(
      name: json['name'] as String,
      value: AmountDTO.fromJson(json['amount'] as Map<String, dynamic>),
    );
  }
}