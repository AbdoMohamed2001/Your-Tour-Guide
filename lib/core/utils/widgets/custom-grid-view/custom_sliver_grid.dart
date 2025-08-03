import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'custom_sliver_grid_item.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    Key? key,
    required this.entityList,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 16.0,
    this.crossAxisSpacing = 16.0,
    this.childAspectRatio = 0.65,
    this.isFavEntity = false,
    this.isEvent = false,
    this.isTour = false,
    this.isTourType = false,
  }) : super(key: key);

  final List<dynamic> entityList;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final bool isFavEntity;
  final bool isEvent;
  final bool isTour;
  final bool isTourType;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => CustomSliverGridItem(
            entity: entityList[index],
            isFavEntity: isFavEntity,
            isEvent: isEvent,
            isTour: isTour,
            isTourType: isTourType,
          ),
          childCount: entityList.length,
        ),
      ),
    );
  }
}

// Grid Item Component with Fixed Size

// Optimized Image Component
