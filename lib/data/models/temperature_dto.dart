import 'package:punk/data/models/temperature_value_dto.dart';

class TemperatureDTO {
  final TemperatureValueDTO temp;
  final int? duration;

  TemperatureDTO({
    required this.temp,
    this.duration,
  });

  factory TemperatureDTO.fromJson(Map<String, dynamic> json) {
    return TemperatureDTO(
      temp: TemperatureValueDTO.fromJson(json['temp'] as Map<String, dynamic>),
      duration: json['duration'] as int?,
    );
  }
}
