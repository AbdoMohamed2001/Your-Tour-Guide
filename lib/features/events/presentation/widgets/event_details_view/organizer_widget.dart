import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/event_entity.dart';

class OrganizerWidget extends StatelessWidget {
  const OrganizerWidget({
    super.key,
    required this.eventEntity,
  });

  final EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).moreInformation,
          textAlign: TextAlign.center,
          style: TextStyles.bold16,
        ),
        SizedBox(width: 25),
        GestureDetector(
          onTap: () async {
            var url = Uri.parse(eventEntity.website);
            if (await canLaunchUrl(
              url,
            )) {
              await launchUrl(url);
            }
            ;
          },
          child: Image.network(
            'https://www.tripsinegypt.com/wp-content/uploads/2022/11/trips-in-egypt-logo.png',
            width: 120,
            height: 70,
          ),
        )
      ],
    );
  }
}
