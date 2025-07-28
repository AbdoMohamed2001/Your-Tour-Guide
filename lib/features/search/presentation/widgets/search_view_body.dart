import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/functions/navigate_to_services_details_screen.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_text_field.dart';
import 'package:your_tour_guide/features/search/domain/entities/search_params_entity.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search_suggestion/search_suggestion_cubit.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/suggestions_widget.dart';

import '../../../../generated/l10n.dart';
import '../cubit/search/search_cubit.dart';
import 'build_empty_state.dart';
import 'build_error_state.dart';
import 'build_init_state.dart';
import 'build_loading_state.dart';
import 'build_success_state.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounceTimer;
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _showSuggestions = false;
      });
      return;
    }

    // Debounce suggestions
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (_focusNode.hasFocus) {
        context.read<SearchSuggestionCubit>().getSuggestions(query);
        setState(() {
          _showSuggestions = true;
        });
      }
    });
  }

  void _performSearch({String? query}) {
    final searchQuery = _searchController.text.trim();
    if (searchQuery.isEmpty) return;
    _focusNode.unfocus();
    setState(() {
      _showSuggestions = false;
    });

    if (query != null) {
      _searchController.text = query;
    }
    SearchParamsEntity searchParamsEntity = SearchParamsEntity(
      query: searchQuery,
      limit: 10,
    );
    context.read<SearchCubit>().search(searchParamsEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          // Search Bar
          CustomTextField(
            labelText: S.of(context).startSearch,
            prefixIcon: const Icon(Icons.search),
            controller: _searchController,
            focusNode: _focusNode,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  )
                : null,
            textInputType: TextInputType.text,
            onFieldSubmitted: (value) => _performSearch(query: value),
          ),
          Expanded(
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
                      return buildInitialState(context);
                    } else if (state is SearchLoading) {
                      return buildLoadingState();
                    } else if (state is SearchEmpty) {
                      return buildEmptyState(state, context);
                    } else if (state is SearchError) {
                      return buildErrorState(state, context, () {
                        _performSearch();
                      });
                    }
                    return SuccessStateWidget(
                      searchResults: context.read<SearchCubit>().searchResults,
                      query: context.read<SearchCubit>().searchQuery,
                    );
                  },
                ),
                if (_showSuggestions)
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: SuggestionsWidget(
                      onTap: () => _performSearch(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
