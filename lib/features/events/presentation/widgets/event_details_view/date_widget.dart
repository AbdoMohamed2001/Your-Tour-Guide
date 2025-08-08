import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/event_entity.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.eventEntity,
  });

  final EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          Assets.imagesCalendar,
          width: 90,
          height: 90,
        ),
        Column(
          children: [
            Text(
              S.of(context).startDate,
              style: TextStyles.bold18,
            ),
            Text(
              eventEntity.startDate,
              style: TextStyles.regular18,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              S.of(context).endDate,
              style: TextStyles.bold18,
            ),
            Text(
              eventEntity.endDate,
              style: TextStyles.regular18,
            ),
          ],
        ),
      ],
    );
  }
}
