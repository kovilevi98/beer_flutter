import 'package:flutter_test/flutter_test.dart';
import 'package:punk/domain/entities/beer.dart';

void main() {
  group('Beer', () {
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
      "volume": {"value": 330.0, "unit": "ml"},
      "boil_volume": {"value": 25.0, "unit": "liters"},
      "method": {
        "mash_temp": [
          {
            "temp": {"value": 65.0, "unit": "Celsius"},
            "duration": 60
          }
        ],
        "fermentation": {
          "temp": {"value": 20.0, "unit": "Celsius"},
          "duration": 60
        },
        "twist": "Sample Twist"
      },
      "ingredients": {
        "malt": [
          {
            "name": "Sample Malt",
            "amount": {"value": 500.0, "unit": "grams"}
          }
        ],
        "hops": [
          {
            "name": "Sample Hops",
            "amount": {"value": 25.0, "unit": "grams"},
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

    test('fromJson should correctly deserialize JSON for Beer', () {
      final beer = Beer.fromJson(json);

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
      expect(beer.boilVolume?.value, 25.0);
      expect(beer.boilVolume?.unit, 'liters');
      expect(beer.method?.mashTemp?[0].temp.value, 65.0);
      expect(beer.method?.mashTemp?[0].temp.unit, 'Celsius');
      expect(beer.method?.mashTemp?[0].duration, 60);
      expect(beer.method?.fermentation?.temp.value, 20.0);
      expect(beer.method?.fermentation?.temp.unit, 'Celsius');
      expect(beer.method?.fermentation?.duration, 60);
      expect(beer.method?.twist, 'Sample Twist');
      expect(beer.ingredients?.malt?[0].name, 'Sample Malt');
      expect(beer.ingredients?.malt?[0].value?.value, 500);
      expect(beer.ingredients?.malt?[0].value?.unit, 'grams');
      expect(beer.ingredients?.hops?[0].name, 'Sample Hops');
      expect(beer.ingredients?.hops?[0].amount.value, 25.0);
      expect(beer.ingredients?.hops?[0].amount.unit, 'grams');
      expect(beer.ingredients?.hops?[0].add, 'start');
      expect(beer.ingredients?.hops?[0].attribute, 'bitter');
      expect(beer.ingredients?.yeast, 'Sample Yeast');
      expect(beer.foodPairing, ['Food Pairing 1', 'Food Pairing 2']);
      expect(beer.brewersTips, 'Sample Tips');
      expect(beer.contributedBy, 'Contributor Name');
    });

    test('toJson should correctly serialize Beer to JSON', () {
      final beer = Beer.fromJson(json);
      final serializedJson = beer.toJson();

      expect(serializedJson, json);
    });
  });
}