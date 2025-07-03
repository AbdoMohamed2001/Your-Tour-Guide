import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import '../../../../../constants.dart';
import '../../views/restaurant_details_view.dart';
import 'rest_grid_image.dart';

class RestsGridItem extends StatelessWidget {
  const RestsGridItem({
    Key? key,
    required this.restaurantEntity,
  }) : super(key: key);

  final RestaurantEntity restaurantEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantDetailsView(
              restEntity: restaurantEntity,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            RestGridImage(
              restaurantEntity: restaurantEntity,
            ),
          ],
        ),
      ),
    );
  }
}
