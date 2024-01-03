class TemperatureValueDTO {
  final double? value;
  final String? unit;

  TemperatureValueDTO({
    required this.value,
    required this.unit,
  });

  factory TemperatureValueDTO.fromJson(Map<String, dynamic> json) {
    return TemperatureValueDTO(
      value: json['value'] != null ? (json['value'] as num).toDouble() : null,
      unit: json['value'] != null ? json['unit'] as String : null,
    );
  }
}
