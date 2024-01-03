class Volume {
  final double? value;
  final String? unit;

  Volume({
    required this.value,
    required this.unit,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
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
