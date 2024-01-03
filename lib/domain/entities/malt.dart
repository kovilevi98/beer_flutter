import 'package:punk/domain/entities/amount.dart';

class Malt {
  final String? name;
  final Amount? value;

  Malt({
    required this.name,
    required this.value,
  });

  factory Malt.fromJson(Map<String, dynamic> json) {
    return Malt(
      name: json['name'] != null ? json['name'] as String : null,
      value: json['amount'] != null ? Amount.fromJson(json['amount'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': value?.toJson(),
    };
  }
}
