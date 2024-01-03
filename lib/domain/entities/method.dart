import 'package:punk/domain/entities/temperature.dart';

class Method {
  final List<Temperature>? mashTemp;
  final Temperature? fermentation;
  final String? twist;

  Method({
    this.mashTemp,
    this.fermentation,
    this.twist,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      mashTemp: json['mash_temp'] != null ? (json['mash_temp'] as List<dynamic>?)?.map((e) => Temperature.fromJson(e as Map<String, dynamic>)).toList() : null,
      fermentation: json['fermentation'] != null ? Temperature.fromJson(json['fermentation'] as Map<String, dynamic>) : null,
      twist: json['twist'] != null ? json['twist'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mash_temp': mashTemp?.map((x) => x.toJson()).toList(),
      'fermentation': fermentation?.toJson(),
      'twist': twist,
    };
  }
}
