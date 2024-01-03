import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/favorites/favorite_repository.dart';

class FavoriteMockRepository implements FavoriteRepository {
  final List<Beer> _mockFavorites = [];

  @override
  Future<void> addFavorite(Beer beer) async {
    _mockFavorites.add(beer);
  }

  @override
  Future<void> removeFavorite(int beerId) async {
    _mockFavorites.removeWhere((beer) => beer.id == beerId);
  }

  @override
  Future<List<Beer>> getFavorites() async {
    return _mockFavorites;
  }
}
