import 'package:flutter/material.dart';

import '../cubit/search/search_cubit.dart';

Widget buildErrorState(
  SearchError state,
  BuildContext context,
  void Function()? onPressed,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 64,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
        Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          state.message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => onPressed,
          child: const Text('Try Again'),
        ),
      ],
    ),
  );
}
