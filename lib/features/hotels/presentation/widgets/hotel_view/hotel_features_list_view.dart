import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/hotels/presentation/widgets/hotel_feature_grid_item.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../domain/entities/hotel_entity.dart';

class HotelFeaturesListView extends StatelessWidget {
  const HotelFeaturesListView({
    super.key,
    required this.hotelEntity,
  });

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.084,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HotelFeatureGridItem(
          hotelFeatures:
              isArabic() ? hotelEntity.featuresArabic : hotelEntity.features,
          index: index,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: hotelEntity.features.length,
      ),
    );
  }
}
