class AmountDTO {
  final double value;
  final String unit;

  AmountDTO({
    required this.value,
    required this.unit,
  });

  factory AmountDTO.fromJson(Map<String, dynamic> json) {
    return AmountDTO(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );
  }
}
