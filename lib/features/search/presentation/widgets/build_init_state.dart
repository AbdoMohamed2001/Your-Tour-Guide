import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/app_colors.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../generated/l10n.dart';

Widget buildInitialState(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          size: 64,
          color: AppColors.primaryColor,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).startSearch,
          style: TextStyles.bold16,
        ),
      ],
    ),
  );
}
