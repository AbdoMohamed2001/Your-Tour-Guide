import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/constants.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/tour_entity.dart';

class TourLocationWidget extends StatelessWidget {
  const TourLocationWidget({
    super.key,
    required this.tourEntity,
  });

  final TourEntity tourEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(text: S.of(context).tourLocation),
        kSizedBox,
        Text(
          isArabic() ? tourEntity.tourLocationArabic : tourEntity.tourLocation,
        ),
      ],
    );
  }
}
