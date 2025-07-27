import 'package:flutter/material.dart';

import '../cubit/search/search_cubit.dart';

Widget buildEmptyState(SearchEmpty state, BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off,
          size: 64,
          color: Theme.of(context).disabledColor,
        ),
        const SizedBox(height: 16),
        Text(
          'No results found',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Try searching for something else',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
        ),
      ],
    ),
  );
}
