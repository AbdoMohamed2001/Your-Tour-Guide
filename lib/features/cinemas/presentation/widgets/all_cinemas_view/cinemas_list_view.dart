import 'package:flutter/material.dart';
import 'package:your_tour_guide/constants.dart';

import '../../../domain/entities/cinema_entity.dart';
import 'cinema_grid_item.dart';

class CinemasListView extends StatelessWidget {
  const CinemasListView({
    super.key,
    required this.list,
  });

  final List<CinemaEntity> list;

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
          itemBuilder: (_, i) => CinemaGridItem(cinemaEntity: list[i]),
          itemCount: list.length,
        ),
      ],
    );
  }
}
