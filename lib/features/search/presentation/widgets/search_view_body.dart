import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_text_field.dart';
import 'package:your_tour_guide/features/search/domain/entities/search_params_entity.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search_suggestion/search_suggestion_cubit.dart';
import 'package:your_tour_guide/features/search/presentation/widgets/search_results/search_content_area.dart';
import '../../../../generated/l10n.dart';
import '../cubit/search/search_cubit.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounceTimer;
  bool _showSuggestionsWidget = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _showSuggestionsWidget =
          _focusNode.hasFocus && _searchController.text.isNotEmpty;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      context.read<SearchCubit>().clearSearch();
      setState(() {
        _showSuggestionsWidget = false;
      });
      return;
    }

    // Debounce suggestions
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (_focusNode.hasFocus) {
        context.read<SearchSuggestionCubit>().getSuggestions(query);
        setState(() {
          _showSuggestionsWidget = true;
        });
      }
    });
  }

  void _performSearch({String? query}) {
    final searchQuery = query ?? _searchController.text.trim();
    if (searchQuery.isEmpty) return;
    _focusNode.unfocus();
    setState(() {
      _showSuggestionsWidget = false;
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
          // SEARCH BAR
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
          // CONTENT AREA
          SearchContentArea(
              showSuggestionsWidget: _showSuggestionsWidget,
              performSearch: _performSearch),
        ],
      ),
    );
  }
}
