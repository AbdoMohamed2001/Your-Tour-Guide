import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../generated/l10n.dart';
import 'package:your_tour_guide/features/places/domain/entities/place_entity.dart';

class TransportWidget extends StatelessWidget {
  const TransportWidget({
    super.key,
    required this.placeEntity,
  });

  final PlaceEntity placeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(text: S.of(context).transport),
        ListView.separated(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, index) => Text(
            isArabic()
                ? placeEntity.transportArabic['transport'][index]
                : placeEntity.transport['transport'][index],
          ),
          separatorBuilder: (_, index) => SizedBox(height: 2),
          itemCount: isArabic()
              ? placeEntity.transportArabic['transport'].length
              : placeEntity.transport['transport'].length,
        ),
        kSizedBox,
      ],
    );
  }
}
