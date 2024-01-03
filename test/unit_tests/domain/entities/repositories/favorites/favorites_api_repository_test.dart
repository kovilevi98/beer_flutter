import 'package:flutter_test/flutter_test.dart';
import 'package:punk/data/datasources/favorites/favorites_shared_preferences.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/entities/method.dart';
import 'package:punk/domain/entities/volume.dart';
import 'package:punk/domain/repositories/favorites/favorite_local_repository.dart';

void main() {
  group('FavoriteLocalRepository', () {
    test('addFavorite should add a favorite Beer', () async {
      final beer = Beer(
          tagline: 'Sample tagline',
          firstBrewed: 'Sample first brewed',
          description: 'Sample description',
          imageUrl: 'Sample image URL',
          abv: 5.0,
          ibu: 20,
          targetFg: 1010,
          targetOg: 1050,
          ebc: 10,
          srm: 5,
          ph: 4.5,
          attenuationLevel: 80,
          volume: Volume(value: 330, unit: 'ml'),
          boilVolume: Volume(value: 25, unit: 'l'),
          method: Method(),
          ingredients: null,
          foodPairing: ['Food pairing 1', 'Food pairing 2'],
          brewersTips: 'Sample brewer tips',
          contributedBy: 'Contributor',
          id: 1,
          name: 'asd');

      final favoriteLocalRepository = FavoriteLocalRepository(stubFavoritesSharedPreferences());

      await favoriteLocalRepository.addFavorite(beer);

      final favorites = await favoriteLocalRepository.getFavorites();
      expect(favorites, contains(beer));
    });

    test('removeFavorite should remove a favorite Beer', () async {
      const beerId = 1;

      final favoriteLocalRepository = FavoriteLocalRepository(stubFavoritesSharedPreferences());

      await favoriteLocalRepository.removeFavorite(beerId);

      // Ellenőrizzük, hogy a kedvenc sör eltávolításra került
      final favorites = await favoriteLocalRepository.getFavorites();
      expect(favorites, isNot(contains(beerId)));
    });

    test('getFavorites should return a list of favorite Beers', () async {
      final favoriteLocalRepository = FavoriteLocalRepository(stubFavoritesSharedPreferences());

      final favorites = await favoriteLocalRepository.getFavorites();

      expect(favorites, isNotEmpty);
    });
  });
}

FavoritesSharedPreferences stubFavoritesSharedPreferences() {
  return StubFavoritesSharedPreferences([
    Beer(
        tagline: 'Sample tagline',
        firstBrewed: 'Sample first brewed',
        description: 'Sample description',
        imageUrl: 'Sample image URL',
        abv: 5.0,
        ibu: 20,
        targetFg: 1010,
        targetOg: 1050,
        ebc: 10,
        srm: 5,
        ph: 4.5,
        attenuationLevel: 80,
        volume: Volume(value: 330, unit: 'ml'),
        boilVolume: Volume(value: 25, unit: 'l'),
        method: Method(),
        ingredients: null,
        foodPairing: ['Food pairing 1', 'Food pairing 2'],
        brewersTips: 'Sample brewer tips',
        contributedBy: 'Contributor',
        id: 1,
        name: 'asd')
  ]);
}

class StubFavoritesSharedPreferences implements FavoritesSharedPreferences {
  final List<Beer> fakeFavorites;

  StubFavoritesSharedPreferences(this.fakeFavorites);

  @override
  Future<void> addFavorite(Beer beer) async {
    fakeFavorites.add(beer);
  }

  @override
  Future<void> removeFavorite(int beerId) async {
    fakeFavorites.removeWhere((beer) => beer.id == beerId);
  }

  @override
  Future<List<Beer>> getFavorites() async {
    return fakeFavorites;
  }
}
