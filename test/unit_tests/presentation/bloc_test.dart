import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:punk/data/datasources/beer/beer_api.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/entities/method.dart';
import 'package:punk/domain/entities/volume.dart';
import 'package:punk/domain/repositories/beer/beer_api_repository.dart';
import 'package:punk/domain/usecases/beer/fetch_beers_usecase.dart';
import 'package:punk/presentation/bloc/beer/beer_bloc.dart';

void main() {
  group('BeerBloc', () {
    late BeerBloc beerBloc;
    late FetchBeersUseCase fetchBeersUseCase;

    setUp(() {
      fetchBeersUseCase = MockFetchBeersUseCase(BeerApiRepository(BeerApi(Dio())));
      beerBloc = BeerBloc(fetchBeersUseCase);
    });

    tearDown(() {
      beerBloc.close();
    });

    test('initial state is BeersLoading', () {
      expect(beerBloc.state, isA<BeersLoading>());
    });

    blocTest<BeerBloc, BeerState>(
      'emits BeersLoaded when FetchBeers is added',
      build: () => beerBloc,
      act: (bloc) => bloc.add(FetchBeers()),
      expect: () => [
        isA<BeersLoaded>(),
      ],
    );

    blocTest<BeerBloc, BeerState>(
      'emits BeersLoaded with beers when FetchBeers is added and state is BeersLoaded',
      build: () => beerBloc,
      act: (bloc) {
        bloc.add(FetchBeers());
      },
      expect: () => [
        isA<BeersLoaded>(),
      ],
    );
  });
}

class MockFetchBeersUseCase extends FetchBeersUseCase {
  MockFetchBeersUseCase(super.repository);

  @override
  Future<List<Beer>> call(int page) async {
    final fakeBeers = [
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
    ];

    return fakeBeers;
  }
}
