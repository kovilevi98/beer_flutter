import 'package:flutter/material.dart';
import 'package:punk/presentation/bloc/beer/beer_bloc.dart';
import 'package:punk/presentation/widgets/beers/beer_card.dart';
import 'package:punk/presentation/widgets/texts.dart';

class PunkSliverContent extends StatelessWidget {
  const PunkSliverContent({
    super.key,
    required this.state,
  });

  final BeerState state;

  @override
  Widget build(BuildContext context) {
    if (state is BeersLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (state is BeersError) {
      return const SliverFillRemaining(
        child: Center(child: Text(Texts.errorLoading)),
      );
    }
    if (state is BeersLoaded) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return BeerCard(beer: state.beers[index]);
          },
          childCount: state.beers.length,
        ),
      );
    }
    return const SliverFillRemaining(child: SizedBox.shrink());
  }
}