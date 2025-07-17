import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/default_grid_item.dart';

class DefaultServicesGridView extends StatelessWidget {
  const DefaultServicesGridView({super.key, required this.entityList});
  final List<dynamic> entityList;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5 / 3,
            crossAxisCount: 2,
          ),
          itemBuilder: (_, i) => DefaultGridItem(
            pushedPage: Container(),
            entity: entityList[i],
          ),
          itemCount: entityList.length,
        ),
      ],
    );
  }
}
