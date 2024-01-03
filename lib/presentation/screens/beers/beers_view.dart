import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk/presentation/bloc/beer/beer_bloc.dart';
import 'package:punk/presentation/widgets/beers/punk_sliver_app_bar.dart';
import 'package:punk/presentation/widgets/beers/punk_sliver_content.dart';

class BeersView extends StatefulWidget {
  const BeersView({super.key});

  @override
  _BeersViewState createState() => _BeersViewState();
}

class _BeersViewState extends State<BeersView> {
  final ScrollController _scrollController = ScrollController();
  final double _scrollLimit = 0.9;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchBeers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerBloc, BeerState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[const PunkSliverAppBar(), PunkSliverContent(state: state)],
        );
      },
    );
  }

  void _fetchBeers() {
    context.read<BeerBloc>().add(FetchBeers());
  }

  void _onScroll() {
    if (_isBottom(_scrollController)) {
      _fetchBeers();
    }
  }

  bool _isBottom(ScrollController sc) {
    if (!sc.hasClients) return false;
    final maxScroll = sc.position.maxScrollExtent;
    final currentScroll = sc.offset;
    return currentScroll >= (maxScroll * _scrollLimit);
  }
}
