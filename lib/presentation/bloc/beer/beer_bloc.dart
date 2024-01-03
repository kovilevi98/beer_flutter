import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/usecases/beer/fetch_beers_usecase.dart';

abstract class BeerEvent {}

class FetchBeers extends BeerEvent {}

abstract class BeerState {
  final List<Beer> beers;

  BeerState({required this.beers});
}

class BeersLoading extends BeerState {
  BeersLoading({required super.beers});
}

class BeersLoaded extends BeerState {
  BeersLoaded({required super.beers});
}

class BeersError extends BeerState {
  BeersError({required super.beers});
}

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final FetchBeersUseCase fetchBeersUseCase;
  int currentPage = 1;

  BeerBloc(this.fetchBeersUseCase) : super(BeersLoading(beers: [])) {
    on<FetchBeers>((event, emit) async {
      if (state is BeersLoaded) {
        currentPage++;
      }

      try {
        final beers = await fetchBeersUseCase(currentPage);
        if (state is BeersLoaded) {
          emit(BeersLoaded(beers: [...(state as BeersLoaded).beers, ...beers]));
        } else {
          emit(BeersLoaded(beers: beers));
        }
      } catch (e) {
        emit(BeersError(beers: []));
      }
    });
  }
}
