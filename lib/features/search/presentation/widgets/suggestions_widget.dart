import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_suggestion/search_suggestion_cubit.dart';

class SuggestionsWidget extends StatelessWidget {
  const SuggestionsWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: BlocBuilder<SearchSuggestionCubit, SearchSuggestionState>(
          builder: (context, state) {
            if (state is SearchSuggestionsLoading) {
              return Container(
                height: 60,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                ),
              );
            } else if (state is SearchSuggestionsSuccess) {
              if (state.suggestions.isEmpty) {
                return Container(
                  height: 60,
                  child: const Center(
                    child: Text('No suggestions'),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = state.suggestions[index];
                  return ListTile(
                    leading: const Icon(Icons.search),
                    title: Text(suggestion),
                    onTap: onTap,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
