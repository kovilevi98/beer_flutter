import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/favorites/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<Beer>> call() async {
    return await repository.getFavorites();
  }
}