import 'package:punk/data/models/amount_dto.dart';

class HopsDTO {
  final String name;
  final AmountDTO amount;
  final String add;
  final String attribute;

  HopsDTO({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  factory HopsDTO.fromJson(Map<String, dynamic> json) {
    return HopsDTO(
      name: json['name'] as String,
      amount: AmountDTO.fromJson(json['amount'] as Map<String, dynamic>),
      add: json['add'] as String,
      attribute: json['attribute'] as String,
    );
  }
}