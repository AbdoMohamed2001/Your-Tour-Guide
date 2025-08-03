import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/services_grid_view_item.dart';
import 'build_services_widget.dart';

class ServicesGridView extends StatelessWidget {
  const ServicesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 1.6 / 1.5,
      ),
      itemBuilder: (_, index) => ServicesGridViewItem(index: index),
      itemCount: listOfServicesContainerEntity.length,
    );
  }
}
