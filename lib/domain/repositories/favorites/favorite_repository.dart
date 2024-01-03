import 'package:punk/domain/entities/beer.dart';

abstract class FavoriteRepository {
  Future<void> addFavorite(Beer beer);
  Future<void> removeFavorite(int beerId);
  Future<List<Beer>> getFavorites();
}
