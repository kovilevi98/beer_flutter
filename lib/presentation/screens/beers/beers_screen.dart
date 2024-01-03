import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk/domain/usecases/beer/fetch_beers_usecase.dart';
import 'package:punk/presentation/bloc/beer/beer_bloc.dart';
import 'package:punk/presentation/screens/beers/beers_view.dart';
import 'package:punk/services/locator.dart';

class BeersScreen extends StatelessWidget {
  const BeersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BeerBloc(locator<FetchBeersUseCase>()),
        child: const BeersView(),
      ),
    );
  }
}
