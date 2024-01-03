import 'package:punk/domain/entities/amount.dart';

class Hops {
  final String name;
  final Amount amount;
  final String add;
  final String attribute;

  Hops({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  factory Hops.fromJson(Map<String, dynamic> json) {
    return Hops(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      add: json['add'] as String,
      attribute: json['attribute'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount.toJson(),
      'add': add,
      'attribute': attribute,
    };
  }
}