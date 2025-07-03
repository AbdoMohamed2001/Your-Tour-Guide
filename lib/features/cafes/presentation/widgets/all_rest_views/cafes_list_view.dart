import 'package:flutter/material.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import 'package:your_tour_guide/features/cafes/presentation/widgets/all_rest_views/cafe_grid_item.dart';

class CafesListView extends StatelessWidget {
  const CafesListView({
    super.key,
    required this.list,
  });

  final List<CafeEntity> list;

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
          itemBuilder: (_, i) => CafeGridItem(cafeEntity: list[i]),
          itemCount: list.length,
        ),
      ],
    );
  }
}
