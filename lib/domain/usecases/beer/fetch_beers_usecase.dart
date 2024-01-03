import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/beer/beer_repository.dart';

class FetchBeersUseCase {
  final BeerRepository repository;

  FetchBeersUseCase(this.repository);

  Future<List<Beer>> call(int page) async {
    return repository.fetchBeers(page);
  }
}