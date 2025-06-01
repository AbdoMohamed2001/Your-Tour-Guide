import 'package:your_tour_guide/models/features_contianer_entity.dart';
import 'package:your_tour_guide/widgets/services_provider_item.dart';
import 'package:flutter/material.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(1),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65 / .40,
      ),
      itemBuilder: (context, index) {
        return FeaturesGridViewItem(
          fileName: getFeaturesList(context)[index].fileName,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return getFeaturesList(context)[index].pushedPage;
            }));
          },
          boxDecorationColor: getFeaturesList(context)[index].containerColor,
          text: getFeaturesList(context)[index].name,
        );
      },
      itemCount: getFeaturesList(context).length,
    );
  }
}
