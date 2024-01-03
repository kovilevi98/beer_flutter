import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:punk/data/datasources/beer/beer_api.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/beer/beer_api_repository.dart';

class MockBeerApi extends Mock implements BeerApi {}

void main() {
  group('BeerApiRepository', () {
    test('fetchBeers should return a list of Beer entities when successful', () async {
      final fakeApiResponse = [
        {
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
        }
      ];
      var api = StubBeerApi(fakeApiResponse);

      BeerApiRepository beerApiRepository = BeerApiRepository(api);
      
      final result = await beerApiRepository.fetchBeers(1);

      expect(result, isA<List<Beer>>());
      expect(result.length, greaterThan(0));
      expect(result.first.name, equals('Sample Beer'));
    });
  });
}

class StubBeerApi implements BeerApi {
  final List<Map<String, dynamic>> fakeApiResponse;

  StubBeerApi(this.fakeApiResponse);

  @override
  Future<Response> fetchBeers({int? page, int? perPage}) async {
    return Response(data: fakeApiResponse, statusCode: 200, requestOptions: RequestOptions());
  }
}
