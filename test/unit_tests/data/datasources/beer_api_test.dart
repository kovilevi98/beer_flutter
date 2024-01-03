import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:dio/dio.dart';
import 'package:punk/data/datasources/api_contants.dart';
import 'package:punk/data/datasources/beer/beer_api.dart';

void main() {
  group('BeerApi Tests', () {
    late BeerApi beerApi;
    late Dio dio;
    late DioAdapter dioAdapter;

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      beerApi = BeerApi(dio);
    });

    test('fetchBeers should return a Response object on successful API call', () async {
      dioAdapter.onGet(
        ApiConstants.beersEndPoint,
        (server) => server.reply(200, 'fake data'),
        queryParameters: {'page': 1, 'per_page': 10},
      );

      final response = await beerApi.fetchBeers();

      expect(response, isA<Response>());
      expect(response.statusCode, 200);
      expect(response.data, 'fake data');
    });

    test('fetchBeers should rethrow DioException on API call failure', () async {
      dioAdapter.onGet(
        ApiConstants.beersEndPoint,
        (server) => server.throws(400, DioException(
          requestOptions: RequestOptions(path: ApiConstants.beersEndPoint),
          error: 'Error',
        )),
        queryParameters: {'page': 1, 'per_page': 10},
      );

      expect(() async => await beerApi.fetchBeers(), throwsA(isA<DioException>()));
    });
  });
}