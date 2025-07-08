import 'package:flutter/material.dart';
import 'package:your_tour_guide/constants.dart';

import '../../../domain/entities/mall_entity.dart';
import 'mall_grid_item.dart';

class MallsListView extends StatelessWidget {
  const MallsListView({
    super.key,
    required this.list,
  });

  final List<MallEntity> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5 / 3,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (_, i) => MallGridItem(mallEntity: list[i]),
          itemCount: list.length,
        ),
      ],
    );
  }
}
