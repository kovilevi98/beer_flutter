import 'package:punk/domain/entities/ingredient.dart';
import 'package:punk/domain/entities/method.dart';
import 'package:punk/domain/entities/volume.dart';

class Beer {
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
  final Volume? volume;
  final Volume? boilVolume;
  final Method? method;
  final Ingredient? ingredients;
  final List<String>? foodPairing;
  final String? brewersTips;
  final String? contributedBy;

  Beer.empty()
      : id = 0,
        name = '',
        tagline = '',
        firstBrewed = '',
        description = '',
        imageUrl = '',
        abv = 0,
        ibu = 0,
        targetFg = 0,
        targetOg = 0,
        ebc = 0,
        srm = 0,
        ph = 0,
        attenuationLevel = 0,
        volume = null,
        boilVolume = null,
        method = null,
        ingredients = null,
        foodPairing = [],
        brewersTips = '',
        contributedBy = '';

  Beer({
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

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      id: json['id'] as int,
      name: json['name'] != null ? json['name'] as String : null,
      tagline: json['tagline'] != null ? json['tagline'] as String : null,
      firstBrewed: json['first_brewed'] != null ? json['first_brewed'] as String : null,
      description: json['description'] != null ? json['description'] as String : null,
      imageUrl: json['image_url'] != null ? json['image_url'] as String : null,
      abv: json['abv'] != null ? json['abv'] as double : null,
      ibu: json['ibu'] != null ? json['ibu'] as double : null,
      targetFg: json['target_fg'] != null ? json['target_fg'] as double : null,
      targetOg: json['target_og'] != null ? json['target_og'] as double : null,
      ebc: json['ebc'] != null ? json['ebc'] as double : null,
      srm: json['srm'] != null ? json['srm'] as double : null,
      ph: json['ph'] != null ? json['ph'] as double : null,
      attenuationLevel: json['attenuation_level'] != null ? json['attenuation_level'] as double : null,
      volume: json['volume'] != null ? Volume.fromJson(json['volume'] as Map<String, dynamic>) : null,
      boilVolume: json['boil_volume'] != null ? Volume.fromJson(json['boil_volume'] as Map<String, dynamic>) : null,
      method: json['method'] != null ? Method.fromJson(json['method'] as Map<String, dynamic>) : null,
      ingredients: json['ingredients'] != null ? Ingredient.fromJson(json['ingredients'] as Map<String, dynamic>) : null,
      foodPairing: json['food_pairing'] != null ? List<String>.from(json['food_pairing'] as List) : null,
      brewersTips: json['brewers_tips'] != null ? json['brewers_tips'] as String : null,
      contributedBy: json['contributed_by'] != null ? json['contributed_by'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'first_brewed': firstBrewed,
      'description': description,
      'image_url': imageUrl,
      'abv': abv,
      'ibu': ibu,
      'target_fg': targetFg,
      'target_og': targetOg,
      'ebc': ebc,
      'srm': srm,
      'ph': ph,
      'attenuation_level': attenuationLevel,
      'volume': volume?.toJson(),
      'boil_volume': boilVolume?.toJson(),
      'method': method?.toJson(),
      'ingredients': ingredients?.toJson(),
      'food_pairing': foodPairing,
      'brewers_tips': brewersTips,
      'contributed_by': contributedBy,
    };
  }
}
