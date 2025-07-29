import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/tour_entity.dart';

class TourOrganizerWidget extends StatelessWidget {
  const TourOrganizerWidget({
    super.key,
    required this.tourEntity,
  });

  final TourEntity tourEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeadText(text: S.of(context).tourOrganizer),
        SizedBox(width: 5),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
          ),
          child: Image.network(
            tourEntity.tripOrganizerLogo,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 5),
        Text(
          textAlign: TextAlign.center,
          isArabic()
              ? tourEntity.tripOrganizerArabic.replaceAll('_b', '\n')
              : tourEntity.tripOrganizer.replaceAll('_b', '\n'),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
