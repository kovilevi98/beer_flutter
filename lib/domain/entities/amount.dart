class Amount {
  final double? value;
  final String? unit;

  Amount({
    required this.value,
    required this.unit,
  });

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      value: json['value'] != null ? json['value'] as double : null,
      unit: json['unit'] != null ? json['unit'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
    };
  }
}
