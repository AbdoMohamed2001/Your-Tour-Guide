import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/custom_sliver_grid.dart';

class GridListView extends StatelessWidget {
  const GridListView({
    super.key,
    required this.list,
    this.isFavEntity = false,
  });

  final List<dynamic> list;
  final bool isFavEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverGrid(
          entityList: list,
          isFavEntity: isFavEntity,
        ),
      ],
    );
  }
}
