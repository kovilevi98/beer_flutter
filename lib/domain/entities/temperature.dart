import 'package:punk/domain/entities/temperature_value.dart';

class Temperature {
  final TemperatureValue temp;
  final int? duration;

  Temperature({
    required this.temp,
    this.duration,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: TemperatureValue.fromJson(json['temp'] as Map<String, dynamic>),
      duration: json['duration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp.toJson(),
      'duration': duration,
    };
  }
}
