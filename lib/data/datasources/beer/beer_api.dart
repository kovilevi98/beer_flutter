import 'package:dio/dio.dart';
import 'package:punk/data/datasources/api_contants.dart';

class BeerApi {
  final Dio _dio;

  BeerApi(this._dio);

  Future<Response<dynamic>> fetchBeers({int page = 1, int perPage = 10}) async {
    try {
      return await _dio.get(ApiConstants.beersEndPoint, queryParameters: {ApiConstants.page: page, ApiConstants.perPage: perPage});
    } on DioException {
      rethrow;
    }
  }
}
