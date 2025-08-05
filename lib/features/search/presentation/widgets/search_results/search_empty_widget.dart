import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesSearchNoResult,
            height: 240,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).NoResultsReturned,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
