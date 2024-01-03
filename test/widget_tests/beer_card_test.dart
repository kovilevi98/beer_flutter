import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:punk/data/datasources/favorites/favorites_shared_preferences.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/entities/method.dart';
import 'package:punk/domain/entities/volume.dart';
import 'package:punk/domain/repositories/favorites/favorite_local_repository.dart';
import 'package:punk/domain/usecases/favorites/get_favorites_usecase.dart';
import 'package:punk/domain/usecases/favorites/update_favorites_usecase.dart';
import 'package:punk/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:punk/presentation/widgets/beers/beer_card.dart';
import 'package:punk/services/locator.dart';

void main() {
  late GetIt getIt;

  setUp(() {
    getIt = GetIt.instance;
    getIt.registerSingleton<FavoritesBloc>(FavoritesBloc(
      GetFavoritesUseCase(FavoriteLocalRepository(FavoritesSharedPreferences())),
      UpdateFavoritesUseCase(FavoriteLocalRepository(FavoritesSharedPreferences())),
    ));
  });

  tearDown(() {
    getIt.reset(); // Reseteld a GetIt konténert a teszt után
  });

  testWidgets('BeerCard displays beer information', (WidgetTester tester) async {    
    final favoritesBloc = locator<FavoritesBloc>();
    favoritesBloc.emit(FavoritesState(favorites: []));
    final beer = Beer(
        tagline: 'Sample tagline',
        firstBrewed: 'Sample first brewed',
        description: 'Sample description',
        imageUrl: null,
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
        name: 'Sample Beer');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: favoritesBloc,
            child: BeerCard(beer: beer),
          ),
        ),
      ),
    );

    expect(find.text('Sample Beer'), findsOneWidget);
    expect(find.text('Sample tagline'), findsOneWidget);

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);

    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    // expect(find.byIcon(Icons.favorite_border), findsNothing);
    // expect(find.byIcon(Icons.favorite), findsOneWidget);

    // await tester.tap(find.byIcon(Icons.favorite));
    // await tester.pump();

    // expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    // expect(find.byIcon(Icons.favorite), findsNothing);
  });
}
