import 'package:flutter/material.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';
import 'package:your_tour_guide/features/mosques/presentation/widgets/all_mosques_view/mosque_grid_item.dart';

class MosquesListView extends StatelessWidget {
  const MosquesListView({
    super.key,
    required this.list,
  });

  final List<MosqueEntity> list;

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
          itemBuilder: (_, i) => MosqueGridItem(mosqueEntity: list[i]),
          itemCount: list.length,
        ),
      ],
    );
  }
}
