import 'package:your_tour_guide/features/feature_details/domain/entities/features_contianer_entity.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/features_grid_view_item.dart';
import 'package:flutter/material.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: getFeaturesList(context).length,
      itemBuilder: (context, index) {
        return FeaturesGridViewItem(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return getFeaturesList(context)[index].pushedPage;
                },
              ),
            );
          },
          boxDecorationColor: getFeaturesList(context)[index].containerColor,
          text: getFeaturesList(context)[index].name,
          fileName: getFeaturesList(context)[index].icon,
        );
      },
      // delegate: SliverChildBuilderDelegate(
      //   (context, index) => FeaturesGridViewItem(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) {
      //             return getFeaturesList(context)[index].pushedPage;
      //           },
      //         ),
      //       );
      //     },
      //     boxDecorationColor: getFeaturesList(context)[index].containerColor,
      //     text: getFeaturesList(context)[index].name,
      //     fileName: getFeaturesList(context)[index].icon,
      //   ),
      //   childCount: getFeaturesList(context).length,
      // ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1.05,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
      ),
    );
  }
}
