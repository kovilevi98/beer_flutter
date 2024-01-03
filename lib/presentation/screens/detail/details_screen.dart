import 'dart:async';

import 'package:flutter/material.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:punk/presentation/widgets/colors.dart';
import 'package:punk/presentation/widgets/constants.dart';
import 'package:punk/presentation/widgets/detail/beer_text_details.dart';
import 'package:punk/services/locator.dart';

class DetailsScreen extends StatefulWidget {
  final Beer beer;

  const DetailsScreen({super.key, required this.beer});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final double _favIconSize = 40;
  final double _favIconPositionTop = 0;
  final double _favIconPositionRight = 30;
  late FavoritesBloc _favoritesBloc;
  late StreamSubscription _favoritesSubscription;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _favoritesBloc = locator<FavoritesBloc>();
    _isFavorite = _favoritesBloc.state.favorites.any((b) => b.id == widget.beer.id);

    _favoritesSubscription = _favoritesBloc.stream.listen((state) {
      bool newFavoriteStatus = state.favorites.any((b) => b.id == widget.beer.id);
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
    final bool isFavorite = favoritesBloc.state.favorites.any((b) => b.id == widget.beer.id);

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(Constants.cardCornerRadius),
          ),
        ),
        backgroundColor: AppColors.lightGreen,
        title: Text(widget.beer.name ?? ''),
      ),
      body: getCard(isFavorite),
    );
  }

  Card getCard(bool isFavorite) {
    return Card(
      color: AppColors.lightGreenTransparent,
      child: Padding(
        padding: const EdgeInsets.all(Constants.mainPadding),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.beer.imageUrl != null) Image.network(widget.beer.imageUrl!, height: Constants.picHeight, fit: BoxFit.cover),
                      if (widget.beer.imageUrl == null) const Icon(Icons.image_not_supported, size: Constants.picHeight),
                    ],
                  ),
                  Positioned(
                    right: _favIconPositionRight,
                    top: _favIconPositionTop,
                    child: IconButton(
                        icon: Icon(
                          size: _favIconSize,
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                        ),
                        onPressed: _toggleFavorite),
                  ),
                ],
              ),
              BeerTextDetails(beer: widget.beer),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    if (_isFavorite) {
      _favoritesBloc.add(FavoriteRemoved(widget.beer));
    } else {
      _favoritesBloc.add(FavoriteAdded(widget.beer));
    }
  }
}
