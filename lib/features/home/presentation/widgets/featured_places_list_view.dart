import 'package:your_tour_guide/core/domain/entities/place_entity.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/featured_place_item.dart';
import 'package:flutter/material.dart';

class FeaturedPlacesListView extends StatelessWidget {
  const FeaturedPlacesListView({
    super.key,
    required this.places,
  });
  final List<PlaceEntity> places;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => FeaturedPlaceItem(
          index: index,
          placeEntity: places[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        itemCount: 5,
      ),
    );
  }
}
