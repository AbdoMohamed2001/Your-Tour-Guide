import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/text_styles.dart';

class TourDetailsItem extends StatelessWidget {
  const TourDetailsItem({super.key, required this.head, required this.text});

  final String head;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          head,
          style: TextStyles.bold16,
        ),
        Text(text),
      ],
    );
  }
}
