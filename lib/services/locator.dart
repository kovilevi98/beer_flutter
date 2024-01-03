import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:punk/data/datasources/api_contants.dart';
import 'package:punk/data/datasources/beer/beer_api.dart';
import 'package:punk/data/datasources/favorites/favorites_shared_preferences.dart';
import 'package:punk/domain/repositories/beer/beer_api_repository.dart';
import 'package:punk/domain/repositories/beer/beer_mock_repository.dart';
import 'package:punk/domain/repositories/beer/beer_repository.dart';
import 'package:punk/domain/repositories/favorites/favorite_local_repository.dart';
import 'package:punk/domain/repositories/favorites/favorite_mock_repository.dart';
import 'package:punk/domain/repositories/favorites/favorite_repository.dart';
import 'package:punk/domain/usecases/beer/fetch_beers_usecase.dart';
import 'package:punk/domain/usecases/favorites/get_favorites_usecase.dart';
import 'package:punk/domain/usecases/favorites/update_favorites_usecase.dart';
import 'package:punk/presentation/bloc/favorites/favorites_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator({bool isMock = false}) {
  locator.registerFactory(() => FavoritesSharedPreferences());

  locator.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
        receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
      )));
  if (isMock) {
    locator.registerLazySingleton<FavoriteRepository>(() => FavoriteMockRepository());
    locator.registerLazySingleton<BeerRepository>(() => BeerMockRepository());
  } else {
    locator.registerLazySingleton<FavoriteRepository>(() => FavoriteLocalRepository(locator<FavoritesSharedPreferences>()));
    locator.registerLazySingleton<BeerRepository>(() => BeerApiRepository(locator<BeerApi>()));
  }

  locator.registerFactory(() => BeerApi(locator<Dio>()));

  locator.registerFactory(() => FetchBeersUseCase(locator<BeerRepository>()));
  locator.registerFactory(() => GetFavoritesUseCase(locator<FavoriteRepository>()));
  locator.registerFactory(() => UpdateFavoritesUseCase(locator<FavoriteRepository>()));
  locator.registerLazySingleton(() => FavoritesBloc(locator<GetFavoritesUseCase>(), locator<UpdateFavoritesUseCase>()));
}
