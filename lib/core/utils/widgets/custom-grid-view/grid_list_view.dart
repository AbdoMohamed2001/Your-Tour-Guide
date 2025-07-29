import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/custom_sliver_grid.dart';

class GridListView extends StatelessWidget {
  const GridListView({
    super.key,
    required this.list,
    this.isFavEntity = false,
    this.isEvent = false,
    this.isTour = false,
    this.isTourType = false,
  });

  final List<dynamic> list;
  final bool isFavEntity;
  final bool isEvent;
  final bool isTour;
  final bool isTourType;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverGrid(
          entityList: list,
          isFavEntity: isFavEntity,
          isEvent: isEvent,
          isTour: isTour,
          isTourType: isTourType,
        ),
      ],
    );
  }
}
