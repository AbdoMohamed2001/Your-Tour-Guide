import 'package:flutter/material.dart';

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
