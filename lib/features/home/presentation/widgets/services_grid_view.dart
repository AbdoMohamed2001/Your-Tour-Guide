import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/services_grid_view_item.dart';
import 'build_services_widget.dart';

class ServicesGridView extends StatelessWidget {
  const ServicesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ServicesGridViewItem(index: index),
        childCount: listOfServicesContainerEntity.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.6 / 1.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
      ),
    );
  }
}
