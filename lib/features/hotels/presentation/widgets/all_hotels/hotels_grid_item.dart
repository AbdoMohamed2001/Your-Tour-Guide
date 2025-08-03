import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/features/hotels/presentation/views/hotel_details_view.dart';
import '../../../../../core/utils/constants.dart';
import 'hotel_grid_features.dart';
import 'hotel_grid_image.dart';

class HotelsGridItem extends StatelessWidget {
  const HotelsGridItem({
    Key? key,
    required this.hotelEntity,
  }) : super(key: key);

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HotelDetailsView(hotelEntity: hotelEntity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            HotelGridImage(
                hotelEntity: hotelEntity, screenHeight: screenHeight),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            HotelGridFeatures(hotelEntity: hotelEntity),
          ],
        ),
      ),
    );
  }
}
