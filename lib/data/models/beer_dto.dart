import 'package:punk/data/models/ingredient_dto.dart';
import 'package:punk/data/models/method_dto.dart';
import 'package:punk/domain/entities/amount.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/entities/hops.dart';
import 'package:punk/domain/entities/ingredient.dart';
import 'package:punk/domain/entities/malt.dart';
import 'package:punk/domain/entities/method.dart';
import 'package:punk/domain/entities/temperature.dart';
import 'package:punk/domain/entities/temperature_value.dart';
import 'package:punk/domain/entities/volume.dart';

class BeerDTO {
  final int id;
  final String? name;
  final String? tagline;
  final String? firstBrewed;
  final String? description;
  final String? imageUrl;
  final double? abv;
  final double? ibu;
  final double? targetFg;
  final double? targetOg;
  final double? ebc;
  final double? srm;
  final double? ph;
  final double? attenuationLevel;
  final Map<String, dynamic>? volume;
  final Map<String, dynamic>? boilVolume;
  final MethodDTO? method;
  final IngredientDTO? ingredients;
  final List<String>? foodPairing;
  final String? brewersTips;
  final String? contributedBy;

  BeerDTO({
    required this.id,
    required this.name,
    required this.tagline,
    required this.firstBrewed,
    required this.description,
    required this.imageUrl,
    required this.abv,
    required this.ibu,
    required this.targetFg,
    required this.targetOg,
    required this.ebc,
    required this.srm,
    required this.ph,
    required this.attenuationLevel,
    required this.volume,
    required this.boilVolume,
    required this.method,
    required this.ingredients,
    required this.foodPairing,
    required this.brewersTips,
    required this.contributedBy,
  });

  factory BeerDTO.fromJson(Map<String, dynamic> json) {
    return BeerDTO(
      id: json['id'] as int,
      name: json['name'] != null ? json['name'] as String : null,
      tagline: json['tagline'] != null ? json['tagline'] as String : null,
      firstBrewed: json['first_brewed'] != null ? json['first_brewed'] as String : null,
      description: json['description'] != null ? json['description'] as String : null,
      imageUrl: json['image_url'] != null ? json['image_url'] as String : null,
      abv: json['abv'] != null ? (json['abv'] as num).toDouble() : null,
      ibu: json['ibu'] != null ? (json['ibu'] as num).toDouble() : null,
      targetFg: json['target_fg'] != null ? (json['target_fg'] as num).toDouble() : null,
      targetOg: json['target_og'] != null ? (json['target_og'] as num).toDouble() : null,
      ebc: json['ebc'] != null ? (json['ebc'] as num).toDouble() : null,
      srm: json['srm'] != null ? (json['srm'] as num).toDouble() : null,
      ph: json['ph'] != null ? (json['ph'] as num).toDouble() : null,
      attenuationLevel: json['attenuation_level'] != null ? (json['attenuation_level'] as num).toDouble() : null,
      volume: json['volume'] != null ? json['volume'] as Map<String, dynamic> : null,
      boilVolume: json['boil_volume'] != null ? json['boil_volume'] as Map<String, dynamic> : null,
      method: json['method'] != null ? MethodDTO.fromJson(json['method'] as Map<String, dynamic>) : null,
      ingredients: json['ingredients'] != null ? IngredientDTO.fromJson(json['ingredients'] as Map<String, dynamic>) : null,
      foodPairing: json['food_pairing'] != null ? List<String>.from(json['food_pairing'] as List) : null,
      brewersTips: json['brewers_tips'] != null ? json['brewers_tips'] as String : null,
      contributedBy: json['contributed_by'] != null ? json['contributed_by'] as String : null,
    );
  }
}

extension BeerMapper on BeerDTO {
  Beer toDomain() {
    return Beer(
      id: id,
      name: name,
      tagline: tagline,
      firstBrewed: firstBrewed,
      description: description,
      imageUrl: imageUrl,
      abv: abv,
      ibu: ibu,
      targetFg: targetFg,
      targetOg: targetOg,
      ebc: ebc,
      srm: srm,
      ph: ph,
      attenuationLevel: attenuationLevel,
      volume: Volume(
        value: (volume?['value'] as num).toDouble(),
        unit: volume?['unit'] as String,
      ),
      boilVolume: Volume(
        value: (boilVolume?['value'] as num).toDouble(),
        unit: boilVolume?['unit'] as String,
      ),
      method: method != null
          ? Method(
              mashTemp: method?.mashTemp
                  ?.map((m) => Temperature(
                        temp: TemperatureValue(
                          value: m.temp.value,
                          unit: m.temp.unit,
                        ),
                        duration: m.duration,
                      ))
                  .toList(),
              fermentation: method?.fermentation != null
                  ? Temperature(
                      temp: TemperatureValue(
                        value: method?.fermentation!.temp.value,
                        unit: method?.fermentation!.temp.unit,
                      ),
                    )
                  : null,
              twist: method?.twist,
            )
          : null,
      ingredients: Ingredient(
        malt: ingredients?.malt
            ?.map(
              (m) => Malt(
                name: m.name,
                value: Amount(
                  value: m.value.value,
                  unit: m.value.unit,
                ),
              ),
            )
            .toList(),
        hops: ingredients?.hops
            ?.map(
              (h) => Hops(
                name: h.name,
                amount: Amount(
                  value: h.amount.value,
                  unit: h.amount.unit,
                ),
                add: h.add,
                attribute: h.attribute,
              ),
            )
            .toList(),
        yeast: ingredients?.yeast,
      ),
      foodPairing: foodPairing,
      brewersTips: brewersTips,
      contributedBy: contributedBy,
    );
  }
}
