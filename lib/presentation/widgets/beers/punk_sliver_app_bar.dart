import 'package:flutter/material.dart';
import 'package:punk/presentation/widgets/assets.dart';
import 'package:punk/presentation/widgets/colors.dart';
import 'package:punk/presentation/widgets/constants.dart';
import 'package:punk/presentation/widgets/texts.dart';

class PunkSliverAppBar extends StatelessWidget {
  final double _sliverAppBarExpandedHeight = 200;
  final bool _sliverAppBarfloating = false;
  final bool _sliverAppBarPinned = true;
  final double _sliverAppBarElevation = 8;
  final double _spaceBarHighTreshold = 60;

  const PunkSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _sliverAppBarExpandedHeight,
      floating: _sliverAppBarfloating,
      pinned: _sliverAppBarPinned,
      elevation: _sliverAppBarElevation,
      backgroundColor: AppColors.lightGreen,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Constants.cardCornerRadius),
        ),
      ),
      flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        var top = constraints.biggest.height;
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          title: top > _spaceBarHighTreshold + MediaQuery.of(context).padding.top
              ? null
              : const Text(
                  Texts.title,
                  style: TextStyle(color: Colors.black),
                ),
          background: Image.asset(
            Assets.sliverAppBarBacgroungImage,
            fit: BoxFit.cover,
          ),
        );
      }),
    );
  }
}
