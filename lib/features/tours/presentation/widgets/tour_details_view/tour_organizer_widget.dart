import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadText(text: S.of(context).tourOrganizer),
        CircleAvatar(
          child: CachedNetworkImage(imageUrl: tourEntity.tripOrganizerLogo),
          radius: 35,
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}
