import 'package:punk/domain/entities/beer.dart';

abstract class BeerRepository {
  Future<List<Beer>> fetchBeers(int page);
}