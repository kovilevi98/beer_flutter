import 'temperature_dto.dart';

class MethodDTO {
  final List<TemperatureDTO>? mashTemp;
  final TemperatureDTO? fermentation;
  final String? twist;

  MethodDTO({
    this.mashTemp,
    this.fermentation,
    this.twist,
  });

  factory MethodDTO.fromJson(Map<String, dynamic> json) {
    return MethodDTO(
      mashTemp: (json['mash_temp'] as List<dynamic>?)?.map((e) => TemperatureDTO.fromJson(e as Map<String, dynamic>)).toList(),
      fermentation: json['fermentation'] != null ? TemperatureDTO.fromJson(json['fermentation'] as Map<String, dynamic>) : null,
      twist: json['twist'] as String?,
    );
  }
}
