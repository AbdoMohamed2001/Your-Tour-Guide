import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_details_item.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/tour_entity.dart';

class TourDetailsWidget extends StatelessWidget {
  const TourDetailsWidget({
    super.key,
    required this.tourEntity,
  });

  final TourEntity tourEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TourDetailsItem(
          head: S.of(context).Price,
          text: tourEntity.startPrice,
        ),
        TourDetailsItem(
          head: S.of(context).Duration,
          text: isArabic() ? tourEntity.durationArabic : tourEntity.duration,
        ),
        TourDetailsItem(
          head: S.of(context).tourAvailability,
          text: isArabic()
              ? tourEntity.tourAvailabilityArabic
              : tourEntity.tourAvailability,
        ),
        TourDetailsItem(
          head: S.of(context).PickFrom,
          text:
              isArabic() ? tourEntity.pickupFromArabic : tourEntity.pickupFrom,
        ),
      ],
    );
  }
}
