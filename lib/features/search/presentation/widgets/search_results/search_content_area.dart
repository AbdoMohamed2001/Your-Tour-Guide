import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_results/search_error_widget.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_results/search_init_widget.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_results/search_success_widget.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_results/search_empty_widget.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_results/search_loading_widget.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_suggestions/suggestions_widget.dart';

import '../../../../../core/utils/functions/navigate_to_services_details_screen.dart';
import '../../cubit/search/search_cubit.dart';

class SearchContentArea extends StatelessWidget {
  const SearchContentArea(
      {super.key,
      required this.showSuggestionsWidget,
      required this.performSearch});

  final bool showSuggestionsWidget;
  final void Function({String? query}) performSearch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is SearchGetEntitySuccess) {
                navigateToServiceDetailsScreen(
                    state.collectionName, context, state.entity);
              }
              if (state is SearchGetEntityError) {
                log('error in getting data ${state.message}');
              }
            },
            builder: (context, state) {
              if (state is SearchInitial) {
                return SearchInitialWidget();
              } else if (state is SearchLoading) {
                return SearchLoadingWidget();
              } else if (state is SearchEmpty) {
                return SearchEmptyWidget();
              } else if (state is SearchError) {
                return SearchErrorWidget(
                    errMessage: state.message,
                    onPressed: () {
                      performSearch();
                    });
              }
              return SearchSuccessWidget(
                searchResults: context.read<SearchCubit>().searchResults,
                query: context.read<SearchCubit>().searchQuery,
              );
            },
          ),
          if (showSuggestionsWidget)
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: SuggestionsWidget(
                onTap: (value) {
                  performSearch(query: value);
                },
              ),
            ),
        ],
      ),
    );
  }
}
