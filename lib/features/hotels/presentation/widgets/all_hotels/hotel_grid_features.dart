import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../hotel_feature_grid_item.dart';
import '../../../domain/entities/hotel_entity.dart';

class HotelGridFeatures extends StatelessWidget {
  const HotelGridFeatures({
    super.key,
    required this.hotelEntity,
  });

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HotelFeatureGridItem(
          index: 0,
          hotelFeatures:
              isArabic() ? hotelEntity.featuresArabic : hotelEntity.features,
        ),
        HotelFeatureGridItem(
          index: 1,
          hotelFeatures:
              isArabic() ? hotelEntity.featuresArabic : hotelEntity.features,
        ),
        HotelFeatureGridItem(
          index: 2,
          hotelFeatures:
              isArabic() ? hotelEntity.featuresArabic : hotelEntity.features,
        ),
      ],
    );
  }
}
