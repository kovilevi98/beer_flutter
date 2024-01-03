import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/favorites/favorite_repository.dart';

class UpdateFavoritesUseCase {
  final FavoriteRepository repository;

  UpdateFavoritesUseCase(this.repository);

  Future<void> addFavorite(Beer beer) async {
    await repository.addFavorite(beer);
  }

  Future<void> removeFavorite(Beer beer) async {
    await repository.removeFavorite(beer.id);
  }
}