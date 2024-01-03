import 'package:flutter_test/flutter_test.dart';
import 'package:punk/data/models/amount_dto.dart';
import 'package:punk/data/models/beer_dto.dart';
import 'package:punk/data/models/hops_dto.dart';
import 'package:punk/data/models/ingredient_dto.dart';
import 'package:punk/data/models/malt_dto.dart';
import 'package:punk/data/models/temperature_dto.dart';
import 'package:punk/data/models/temperature_value_dto.dart';

void main() {
  group('AmountDTO Tests', () {
    test('fromJson should create an AmountDTO from JSON', () {
      Map<String, dynamic> json = {'value': 10, 'unit': 'kg'};

      AmountDTO amount = AmountDTO.fromJson(json);

      expect(amount.value, 10.0);
      expect(amount.unit, 'kg');
    });

    test('fromJson should handle non-integer values', () {
      Map<String, dynamic> json = {'value': 10.5, 'unit': 'kg'};

      AmountDTO amount = AmountDTO.fromJson(json);

      expect(amount.value, 10.5);
      expect(amount.unit, 'kg');
    });
  });

  group('HopsDTO Tests', () {
    test('fromJson should create a HopsDTO from JSON', () {
      Map<String, dynamic> json = {
        'name': 'Cascade',
        'amount': {'value': 10, 'unit': 'grams'},
        'add': 'start',
        'attribute': 'bitter'
      };

      HopsDTO hops = HopsDTO.fromJson(json);

      expect(hops.name, 'Cascade');
      expect(hops.amount.value, 10.0);
      expect(hops.amount.unit, 'grams');
      expect(hops.add, 'start');
      expect(hops.attribute, 'bitter');
    });
  });

  group('MaltDTO', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        'name': 'Barley',
        'amount': {'value': 500, 'unit': 'grams'}
      };

      final maltDTO = MaltDTO.fromJson(json);

      expect(maltDTO.name, 'Barley');
      expect(maltDTO.value.value, 500);
      expect(maltDTO.value.unit, 'grams');
    });
  });

  group('HopsDTO', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        'name': 'Cascade',
        'amount': {'value': 25, 'unit': 'grams'},
        'add': 'start',
        'attribute': 'bitter'
      };

      final hopsDTO = HopsDTO.fromJson(json);

      expect(hopsDTO.name, 'Cascade');
      expect(hopsDTO.amount.value, 25);
      expect(hopsDTO.amount.unit, 'grams');
      expect(hopsDTO.add, 'start');
      expect(hopsDTO.attribute, 'bitter');
    });
  });

  group('IngredientDTO', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        'malt': [
          {
            'name': 'Barley',
            'amount': {'value': 500, 'unit': 'grams'}
          },
          {
            'name': 'Wheat',
            'amount': {'value': 300, 'unit': 'grams'}
          }
        ],
        'hops': [
          {
            'name': 'Cascade',
            'amount': {'value': 25, 'unit': 'grams'},
            'add': 'start',
            'attribute': 'bitter'
          },
          {
            'name': 'Saaz',
            'amount': {'value': 10, 'unit': 'grams'},
            'add': 'end',
            'attribute': 'flavor'
          }
        ],
        'yeast': 'Ale yeast'
      };

      final ingredientDTO = IngredientDTO.fromJson(json);

      expect(ingredientDTO.malt, hasLength(2));
      expect(ingredientDTO.malt![0].name, 'Barley');
      expect(ingredientDTO.malt![0].value.value, 500);
      expect(ingredientDTO.malt![0].value.unit, 'grams');

      expect(ingredientDTO.hops, hasLength(2));
      expect(ingredientDTO.hops![0].name, 'Cascade');
      expect(ingredientDTO.hops![0].amount.value, 25);
      expect(ingredientDTO.hops![0].amount.unit, 'grams');
      expect(ingredientDTO.hops![0].add, 'start');
      expect(ingredientDTO.hops![0].attribute, 'bitter');

      expect(ingredientDTO.yeast, 'Ale yeast');
    });
  });

  group('TemperatureValueDTO', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        'value': 25.5,
        'unit': 'Celsius',
      };

      final temperatureValueDTO = TemperatureValueDTO.fromJson(json);

      expect(temperatureValueDTO.value, 25.5);
      expect(temperatureValueDTO.unit, 'Celsius');
    });

    test('fromJson should handle null values', () {
      final json = {
        'value': null,
        'unit': null,
      };

      final temperatureValueDTO = TemperatureValueDTO.fromJson(json);

      expect(temperatureValueDTO.value, isNull);
      expect(temperatureValueDTO.unit, isNull);
    });
  });

  group('TemperatureDTO', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        'temp': {'value': 25.5, 'unit': 'Celsius'},
        'duration': 60,
      };

      final temperatureDTO = TemperatureDTO.fromJson(json);

      expect(temperatureDTO.temp.value, 25.5);
      expect(temperatureDTO.temp.unit, 'Celsius');
      expect(temperatureDTO.duration, 60);
    });

    test('fromJson should handle null values', () {
      final json = {
        'temp': {'value': null, 'unit': null},
        'duration': null,
      };

      final temperatureDTO = TemperatureDTO.fromJson(json);

      expect(temperatureDTO.temp.value, isNull);
      expect(temperatureDTO.temp.unit, isNull);
      expect(temperatureDTO.duration, isNull);
    });
  });

  group('BeerDTO', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        "id": 1,
        "name": "Sample Beer",
        "tagline": "Sample Tagline",
        "first_brewed": "01/2023",
        "description": "Sample description",
        "image_url": "sample_image_url",
        "abv": 5.5,
        "ibu": 35.0,
        "target_fg": 1010.0,
        "target_og": 1050.0,
        "ebc": 15.0,
        "srm": 10.0,
        "ph": 4.2,
        "attenuation_level": 80.0,
        "volume": {"value": 330, "unit": "ml"},
        "boil_volume": {"value": 25, "unit": "liters"},
        "method": {
          "mash_temp": [
            {
              "temp": {"value": 65.0, "unit": "Celsius"},
              "duration": 60
            }
          ],
          "fermentation": {
            "temp": {"value": 20.0, "unit": "Celsius"}
          },
          "twist": "Sample Twist"
        },
        "ingredients": {
          "malt": [
            {
              "name": "Sample Malt",
              "amount": {"value": 500, "unit": "grams"}
            }
          ],
          "hops": [
            {
              "name": "Sample Hops",
              "amount": {"value": 25, "unit": "grams"},
              "add": "start",
              "attribute": "bitter"
            }
          ],
          "yeast": "Sample Yeast"
        },
        "food_pairing": ["Food Pairing 1", "Food Pairing 2"],
        "brewers_tips": "Sample Tips",
        "contributed_by": "Contributor Name"
      };

      final beerDTO = BeerDTO.fromJson(json);
      final beer = beerDTO.toDomain();

      expect(beer.id, 1);
      expect(beer.name, 'Sample Beer');
      expect(beer.tagline, 'Sample Tagline');
      expect(beer.firstBrewed, '01/2023');
      expect(beer.description, 'Sample description');
      expect(beer.imageUrl, 'sample_image_url');
      expect(beer.abv, 5.5);
      expect(beer.ibu, 35.0);
      expect(beer.targetFg, 1010.0);
      expect(beer.targetOg, 1050.0);
      expect(beer.ebc, 15.0);
      expect(beer.srm, 10.0);
      expect(beer.ph, 4.2);
      expect(beer.attenuationLevel, 80.0);
      expect(beer.volume?.value, 330);
      expect(beer.volume?.unit, 'ml');
      expect(beer.boilVolume?.value, 25);
      expect(beer.boilVolume?.unit, 'liters');
      expect(beer.method?.mashTemp, hasLength(1));
      expect(beer.method?.mashTemp![0].temp.value, 65.0);
      expect(beer.method?.mashTemp![0].temp.unit, 'Celsius');
      expect(beer.method?.mashTemp![0].duration, 60);
      expect(beer.method?.fermentation!.temp.value, 20.0);
      expect(beer.method?.fermentation!.temp.unit, 'Celsius');
      expect(beer.method?.twist, 'Sample Twist');
      expect(beer.ingredients?.malt, hasLength(1));
      expect(beer.ingredients?.malt![0].name, 'Sample Malt');
      expect(beer.ingredients?.malt![0].value?.value, 500);
      expect(beer.ingredients?.malt![0].value?.unit, 'grams');
      expect(beer.ingredients?.hops, hasLength(1));
      expect(beer.ingredients?.hops![0].name, 'Sample Hops');
      expect(beer.ingredients?.hops![0].amount.value, 25);
      expect(beer.ingredients?.hops![0].amount.unit, 'grams');
      expect(beer.ingredients?.hops![0].add, 'start');
      expect(beer.ingredients?.hops![0].attribute, 'bitter');
      expect(beer.ingredients?.yeast, 'Sample Yeast');
      expect(beer.foodPairing, ['Food Pairing 1', 'Food Pairing 2']);
      expect(beer.brewersTips, 'Sample Tips');
      expect(beer.contributedBy, 'Contributor Name');
    });
  });

  group('BeerMapper Extension', () {
    test('toDomain should correctly convert BeerDTO to Beer', () {
      final json = {
        "id": 1,
        "name": "Sample Beer",
        "tagline": "Sample Tagline",
        "first_brewed": "01/2023",
        "description": "Sample description",
        "image_url": "sample_image_url",
        "abv": 5.5,
        "ibu": 35.0,
        "target_fg": 1010.0,
        "target_og": 1050.0,
        "ebc": 15.0,
        "srm": 10.0,
        "ph": 4.2,
        "attenuation_level": 80.0,
        "volume": {"value": 330, "unit": "ml"},
        "boil_volume": {"value": 25, "unit": "liters"},
        "method": {
          "mash_temp": [
            {
              "temp": {"value": 65.0, "unit": "Celsius"},
              "duration": 60
            }
          ],
          "fermentation": {
            "temp": {"value": 20.0, "unit": "Celsius"}
          },
          "twist": "Sample Twist"
        },
        "ingredients": {
          "malt": [
            {
              "name": "Sample Malt",
              "amount": {"value": 500, "unit": "grams"}
            }
          ],
          "hops": [
            {
              "name": "Sample Hops",
              "amount": {"value": 25, "unit": "grams"},
              "add": "start",
              "attribute": "bitter"
            }
          ],
          "yeast": "Sample Yeast"
        },
        "food_pairing": ["Food Pairing 1", "Food Pairing 2"],
        "brewers_tips": "Sample Tips",
        "contributed_by": "Contributor Name"
      };

      final beerDTO = BeerDTO.fromJson(json);
      final beer = beerDTO.toDomain();

      expect(beer.id, 1);
      expect(beer.name, 'Sample Beer');
      expect(beer.tagline, 'Sample Tagline');
      expect(beer.firstBrewed, '01/2023');
      expect(beer.description, 'Sample description');
      expect(beer.imageUrl, 'sample_image_url');
      expect(beer.abv, 5.5);
      expect(beer.ibu, 35.0);
      expect(beer.targetFg, 1010.0);
      expect(beer.targetOg, 1050.0);
      expect(beer.ebc, 15.0);
      expect(beer.srm, 10.0);
      expect(beer.ph, 4.2);
      expect(beer.attenuationLevel, 80.0);
      expect(beer.volume?.value, 330);
      expect(beer.volume?.unit, 'ml');
      expect(beer.boilVolume?.value, 25);
      expect(beer.boilVolume?.unit, 'liters');
      expect(beer.method?.mashTemp, hasLength(1));
      expect(beer.method?.mashTemp![0].temp.value, 65.0);
      expect(beer.method?.mashTemp![0].temp.unit, 'Celsius');
      expect(beer.method?.mashTemp![0].duration, 60);
      expect(beer.method?.fermentation!.temp.value, 20.0);
      expect(beer.method?.fermentation!.temp.unit, 'Celsius');
      expect(beer.method?.twist, 'Sample Twist');
      expect(beer.ingredients?.malt, hasLength(1));
      expect(beer.ingredients?.malt![0].name, 'Sample Malt');
      expect(beer.ingredients?.malt![0].value?.value, 500);
      expect(beer.ingredients?.malt![0].value?.unit, 'grams');
      expect(beer.ingredients?.hops, hasLength(1));
      expect(beer.ingredients?.hops![0].name, 'Sample Hops');
      expect(beer.ingredients?.hops![0].amount.value, 25);
      expect(beer.ingredients?.hops![0].amount.unit, 'grams');
      expect(beer.ingredients?.hops![0].add, 'start');
      expect(beer.ingredients?.hops![0].attribute, 'bitter');
      expect(beer.ingredients?.yeast, 'Sample Yeast');
      expect(beer.foodPairing, ['Food Pairing 1', 'Food Pairing 2']);
      expect(beer.brewersTips, 'Sample Tips');
      expect(beer.contributedBy, 'Contributor Name');
    });
  });
}
