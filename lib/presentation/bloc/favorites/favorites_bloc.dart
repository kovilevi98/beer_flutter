import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/usecases/favorites/get_favorites_usecase.dart';
import 'package:punk/domain/usecases/favorites/update_favorites_usecase.dart';

abstract class FavoritesEvent {}

class FavoriteAdded extends FavoritesEvent {
  final Beer beer;

  FavoriteAdded(this.beer);
}

class FavoriteRemoved extends FavoritesEvent {
  final Beer beer;

  FavoriteRemoved(this.beer);
}

class FavoritesLoaded extends FavoritesEvent {
  final List<Beer> favorites;
  FavoritesLoaded(this.favorites);
}

class FavoritesState {
  final List<Beer> favorites;

  FavoritesState({this.favorites = const []});
}

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final UpdateFavoritesUseCase updateFavoritesUseCase;
  FavoritesBloc(this.getFavoritesUseCase, this.updateFavoritesUseCase) : super(FavoritesState()) {
    on<FavoriteAdded>(_onFavoriteAdded);
    on<FavoriteRemoved>(_onFavoriteRemoved);
    on<FavoritesLoaded>(_onFavoritesLoaded);
    _loadFavorites();
  }

  void _loadFavorites() async {
    final favorites = await getFavoritesUseCase();
    add(FavoritesLoaded(favorites));
  }

  void _onFavoritesLoaded(FavoritesLoaded event, Emitter<FavoritesState> emit) {
    emit(FavoritesState(favorites: event.favorites));
  }

  void _onFavoriteAdded(FavoriteAdded event, Emitter<FavoritesState> emit) async {
    await updateFavoritesUseCase.addFavorite(event.beer);
    final newState = List<Beer>.from(state.favorites)..add(event.beer);
    emit(FavoritesState(favorites: newState));
  }

  void _onFavoriteRemoved(FavoriteRemoved event, Emitter<FavoritesState> emit) async {
    await updateFavoritesUseCase.removeFavorite(event.beer);
    final newState = state.favorites.where((beer) => beer.id != event.beer.id).toList();
    emit(FavoritesState(favorites: newState));
  }
}
