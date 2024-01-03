import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:punk/presentation/widgets/colors.dart';
import 'package:punk/presentation/widgets/constants.dart';
import 'package:punk/presentation/widgets/texts.dart';
import 'package:punk/router.dart';
import 'package:punk/services/locator.dart';

class BeerCard extends StatefulWidget {
  final Beer beer;

  const BeerCard({super.key, required this.beer});

  @override
  _BeerCardState createState() => _BeerCardState();
}

class _BeerCardState extends State<BeerCard> {
  final int _imageFlex = 2;
  final int _textFlex = 6;
  final int _favIconFlex = 1;
  final double _imageHeight = 150;
  late FavoritesBloc _favoritesBloc;
  late StreamSubscription _favoritesSubscription;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _favoritesBloc = locator<FavoritesBloc>();
    _isFavorite = _isBeerFavorite(_favoritesBloc.state.favorites);
    _favoritesSubscription = _favoritesBloc.stream.listen((state) {
      bool newFavoriteStatus = _isBeerFavorite(state.favorites);
      if (newFavoriteStatus != _isFavorite) {
        setState(() {
          _isFavorite = newFavoriteStatus;
        });
      }
    });
  }

  @override
  void dispose() {
    _favoritesSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesBloc favoritesBloc = locator<FavoritesBloc>();

    return InkWell(
      onTap: () {
        context.go('${Routes.home}${Routes.details}', extra: widget.beer);
      },
      child: Card(
        color: AppColors.lightGreenTransparent,
        child: Padding(
          padding: const EdgeInsets.all(Constants.mainPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.beer.imageUrl != null)
                Expanded(
                  flex: _imageFlex,
                  child: Image.network(
                    widget.beer.imageUrl!,
                    fit: BoxFit.fitHeight,
                    height: _imageHeight,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
              if (widget.beer.imageUrl == null) Expanded(flex: _imageFlex, child: const Center(child: Icon(Icons.image_not_supported))),
              Expanded(
                flex: _textFlex,
                child: Padding(
                  padding: const EdgeInsets.all(Constants.mainPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.beer.name ?? Texts.notAvailable,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: Constants.smallSpace),
                      Text(
                        widget.beer.tagline ?? Texts.notAvailable,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: Constants.mediumSpace),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: _favIconFlex,
                child: IconButton(
                  icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    if (_isFavorite) {
                      favoritesBloc.add(FavoriteRemoved(widget.beer));
                    } else {
                      favoritesBloc.add(FavoriteAdded(widget.beer));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isBeerFavorite(List<Beer> favorites) {
    return favorites.any((beer) => beer.id == widget.beer.id);
  }
}
