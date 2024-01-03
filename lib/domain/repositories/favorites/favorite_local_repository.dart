import 'package:punk/data/datasources/favorites/favorites_shared_preferences.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/repositories/favorites/favorite_repository.dart';

class FavoriteLocalRepository implements FavoriteRepository {
  final FavoritesSharedPreferences _favoritesSharedPreferences;

  FavoriteLocalRepository(this._favoritesSharedPreferences);

  @override
  Future<void> addFavorite(Beer beer) async {
    await _favoritesSharedPreferences.addFavorite(beer);
  }

  @override
  Future<void> removeFavorite(int beerId) async {
    await _favoritesSharedPreferences.removeFavorite(beerId);
  }

  @override
  Future<List<Beer>> getFavorites() async {
    return await _favoritesSharedPreferences.getFavorites();
  }
}
