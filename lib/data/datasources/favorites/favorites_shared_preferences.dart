import 'dart:convert';

import 'package:punk/domain/entities/beer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesSharedPreferences {
  static const String _favoritesKey = 'favorites';

  Future<void> addFavorite(Beer beer) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    String beerJson = json.encode(beer.toJson());

    var existingBeer = favorites.firstWhere(
      (b) => json.decode(b)['id'] == beer.id,
      orElse: () => '',
    );

    if (existingBeer.isEmpty) {
      favorites.add(beerJson);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  Future<void> removeFavorite(int beerId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    favorites.removeWhere((beerJson) => json.decode(beerJson)['id'] == beerId);
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<List<Beer>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.map<Beer>((beerJson) => Beer.fromJson(json.decode(beerJson))).toList();
  }
}
