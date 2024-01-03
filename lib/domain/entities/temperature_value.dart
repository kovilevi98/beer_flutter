class TemperatureValue {
  final double? value;
  final String? unit;

  TemperatureValue({
    required this.value,
    required this.unit,
  });

  factory TemperatureValue.fromJson(Map<String, dynamic> json) {
    return TemperatureValue(
      value: json['value'] as double,
      unit: json['unit'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
    };
  }
}
