import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/default_grid_image.dart';

import '../../../constants.dart';

class DefaultGridItem extends StatelessWidget {
  const DefaultGridItem(
      {super.key, required this.pushedPage, required this.entity});

  final Widget pushedPage;
  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => pushedPage,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            DefaultGridImage(entity: entity),
          ],
        ),
      ),
    );
  }
}
