import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../domain/entities/tour_entity.dart';

class TourItineraryItem extends StatelessWidget {
  const TourItineraryItem({
    super.key,
    required this.tourEntity,
    required this.index,
  });

  final TourEntity tourEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage:
              NetworkImage(tourEntity.tourItinerary[index]['imageUrl']),
          radius: 50,
        ),
        SizedBox(
          width: 5,
        ),
        Text(isArabic()
            ? tourEntity.tourItinerary[index]['nameArabic']
                .replaceAll('_b', '\n')
            : tourEntity.tourItinerary[index]['name'].replaceAll('_b', '\n')),
        SizedBox(width: 5),
      ],
    );
  }
}
