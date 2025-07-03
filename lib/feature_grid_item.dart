import 'package:flutter/material.dart';

import 'core/utils/functions/hotelFeaturesIconMap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'features/hotels/presentation/widgets/all_hotels/hotel_features_grid_container.dart';

class HotelFeatureGridItem extends StatelessWidget {
  const HotelFeatureGridItem({
    Key? key,
    required this.hotelFeatures,
    required this.index,
  }) : super(key: key);

  final List hotelFeatures;
  final int index;

  @override
  Widget build(BuildContext context) {
    final feature = hotelFeatures[index];
    final screenHeight = MediaQuery.of(context).size.height;

    final icon = getIconForFeature(feature);

    return Container(
      height: screenHeight * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureGridContainer(icon: icon),
          SizedBox(height: screenHeight * 0.005),
          Text(
            '$feature'.replaceAll('_b', '\n').toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(fontSize: 8),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  IconData getIconForFeature(String feature) {
    for (var entry in featureIconMap.entries) {
      if (feature.toLowerCase().contains(entry.key.toLowerCase())) {
        return entry.value;
      }
    }
    return FontAwesomeIcons.star; // default icon
  }
}
