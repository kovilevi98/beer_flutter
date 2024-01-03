import 'package:punk/data/datasources/api_contants.dart';
import 'package:punk/data/datasources/beer/beer_api.dart';
import 'package:punk/data/models/beer_dto.dart';
import 'package:punk/domain/domain_errors.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/beer/beer_repository.dart';

class BeerApiRepository implements BeerRepository {
  final BeerApi _beerApi;

  BeerApiRepository(this._beerApi);

  @override
  Future<List<Beer>> fetchBeers(int page) async {
    try {
      final response = await _beerApi.fetchBeers(page: page, perPage: ApiConstants.apiPageLimit);
      if (response.data is List) {
        final beerDTOs = (response.data as List).map((json) => BeerDTO.fromJson(json as Map<String, dynamic>)).toList();
        return beerDTOs.map((dto) => dto.toDomain()).toList();
      } else {
        throw Exception(DomainErrors.notListError);
      }
    } catch (e) {
      print('${DomainErrors.exceptionCaught} $e');
      rethrow;
    }
  }
}
