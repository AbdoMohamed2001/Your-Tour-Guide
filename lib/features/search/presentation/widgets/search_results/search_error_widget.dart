import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/constants.dart';

import '../../../../../generated/l10n.dart';

class SearchErrorWidget extends StatelessWidget {
  const SearchErrorWidget(
      {super.key, required this.errMessage, this.onPressed});

  final String errMessage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 64,
          color: Theme.of(context).colorScheme.error,
        ),
        kSizedBox,
        Text(
          //someThingWrong
          S.of(context).someThingWrong,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          errMessage,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
          textAlign: TextAlign.center,
        ),
        kSizedBox,
        ElevatedButton(
          onPressed: () => onPressed,
          child: Text(S.of(context).tryAgain),
        ),
      ],
    );
  }
}
