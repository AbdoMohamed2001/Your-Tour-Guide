import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:your_tour_guide/features/restaurants/presentation/widgets/all_rest_views/restaurants_grid_item.dart';

class RestsListView extends StatelessWidget {
  const RestsListView({
    super.key,
    required this.list,
  });

  final List<RestaurantEntity> list;

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
          itemBuilder: (_, i) => RestsGridItem(
            restaurantEntity: list[i],
          ),
          itemCount: list.length,
        ),
      ],
    );
  }
}
