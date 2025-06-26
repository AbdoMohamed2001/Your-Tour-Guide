import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../functions/is_arabic.dart';

class HowToGoWidget extends StatelessWidget {
  const HowToGoWidget({
    super.key,
    required this.placeEntity,
  });

  final PlaceEntity placeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(text: S.of(context).HowToGo),
        kSizedBox,
        HeadText(text: S.current.metro),
        SizedBox(
          height: 5,
        ),
        Text(
          isArabic()
              ? placeEntity.transportArabic['metro']
              : placeEntity.transport['metro'],
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
