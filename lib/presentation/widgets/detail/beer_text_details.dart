import 'package:flutter/material.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/entities/hops.dart';
import 'package:punk/domain/entities/malt.dart';
import 'package:punk/presentation/widgets/constants.dart';
import 'package:punk/presentation/widgets/texts.dart';

class BeerTextDetails extends StatefulWidget {
  const BeerTextDetails({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  _BeerTextDetailsState createState() => _BeerTextDetailsState();
}

class _BeerTextDetailsState extends State<BeerTextDetails> with SingleTickerProviderStateMixin {
  final int _animationDurationInSeconds = 500;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationDurationInSeconds),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Constants.highSpace),
          Text(widget.beer.tagline ?? ''),
          const SizedBox(height: Constants.mediumSpace),
          Text(widget.beer.description ?? ''),
          const SizedBox(height: Constants.highSpace),
          if (widget.beer.abv != null) Text('${Texts.abv} ${widget.beer.abv}${Texts.percentage}'),
          if (widget.beer.ibu != null) Text('${Texts.ibu} ${widget.beer.ibu}'),
          if (widget.beer.firstBrewed != null) Text('${Texts.firstBrewed} ${widget.beer.firstBrewed}'),
          if (widget.beer.ebc != null) Text('${Texts.ebc} ${widget.beer.ebc}'),
          if (widget.beer.targetOg != null) Text('${Texts.targetOG} ${widget.beer.targetOg}'),
          if (widget.beer.targetFg != null) Text('${Texts.targetFg} ${widget.beer.targetFg}'),
          if (widget.beer.ph != null) Text('${Texts.ph} ${widget.beer.ph}'),
          if (widget.beer.attenuationLevel != null) Text('${Texts.attenuationlevel} ${widget.beer.attenuationLevel}'),
          const Text(Texts.ingredients),
          if (widget.beer.ingredients?.malt != null) _buildMaltSection(Texts.malts, widget.beer.ingredients!.malt!),
          if (widget.beer.ingredients?.hops != null) _buildHopsSection(Texts.hops, widget.beer.ingredients!.hops!),
          if (widget.beer.ingredients?.yeast != null) Text('${Texts.yeast} ${widget.beer.ingredients!.yeast}'),
          if (widget.beer.foodPairing != null && widget.beer.foodPairing!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: Constants.mainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Texts.foodPairing),
                  ...widget.beer.foodPairing!.map((food) => Text(food)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMaltSection(String title, List<Malt> malts) {
    return Padding(
      padding: const EdgeInsets.only(top: Constants.mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          ...malts.map((malt) => Text('${malt.name ?? Texts.notAvailable} - ${malt.value?.value ?? Texts.notAvailable} ${malt.value?.unit ?? ''}')),
        ],
      ),
    );
  }

  Widget _buildHopsSection(String title, List<Hops> hops) {
    return Padding(
      padding: const EdgeInsets.only(top: Constants.mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          ...hops.map((hop) => Text('${hop.name} - ${hop.amount.value ?? Texts.notAvailable} ${hop.amount.unit ?? ''}')),
        ],
      ),
    );
  }
}
