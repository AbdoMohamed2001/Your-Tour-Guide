import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_itinerary_item.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_itinerary_separator.dart';

import '../../../domain/entities/tour_entity.dart';

class TourItineraryWidget extends StatelessWidget {
  const TourItineraryWidget({
    super.key,
    required this.tourEntity,
  });

  final TourEntity tourEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemBuilder: (context, index) => TourItineraryItem(
          tourEntity: tourEntity,
          index: index,
        ),
        itemCount: tourEntity.tourItinerary.length,
        separatorBuilder: (_, index) => TourItinerarySeparator(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
