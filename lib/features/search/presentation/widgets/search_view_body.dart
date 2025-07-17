import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search_suggestion/search_suggestion_cubit.dart';

import '../../../../generated/l10n.dart';
import '../../domain/entities/search_result_entity.dart';
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
  bool _showSuggestions = false;

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
      _showSuggestions =
          _focusNode.hasFocus && _searchController.text.isNotEmpty;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();

    if (query.isEmpty) {
      context.read<SearchSuggestionCubit>().clearSuggestions();
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

  void _performSearch([String? query]) {
    final searchQuery = query ?? _searchController.text.trim();
    if (searchQuery.isEmpty) return;
    _focusNode.unfocus();
    setState(() {
      _showSuggestions = false;
    });

    if (query != null) {
      _searchController.text = query;
    }

    context.read<SearchCubit>().search(
          searchQuery,
          limit: 10,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).search),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: S.of(context).startSearch,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context.read<SearchCubit>().clearSearch();
                          context
                              .read<SearchSuggestionCubit>()
                              .clearSuggestions();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              onSubmitted: (value) => _performSearch(value),
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.name,
            ),
          ),

          // Content Area
          Expanded(
            child: Stack(
              children: [
                // Main Search Results
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      return _buildInitialState();
                    } else if (state is SearchLoading) {
                      return _buildLoadingState();
                    } else if (state is SearchSuccess) {
                      return _buildSuccessState(state);
                    } else if (state is SearchEmpty) {
                      return _buildEmptyState(state);
                    } else if (state is SearchError) {
                      return _buildErrorState(state);
                    }
                    return const SizedBox();
                  },
                ),

                // Search Suggestions Overlay
                if (_showSuggestions)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: _buildSuggestionsOverlay(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 64,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Start typing to search',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.orange),
    );
  }

  Widget _buildSuccessState(SearchSuccess state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Found ${state.results.length} results for "${state.query}"',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              final result = state.results[index];
              return _buildSearchResultItem(result);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(SearchEmpty state) {
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

  Widget _buildErrorState(SearchError state) {
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
            onPressed: () => _performSearch(),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionsOverlay() {
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
                    onTap: () => _performSearch(suggestion),
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

  Widget _buildSearchResultItem(SearchResultEntity result) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getCollectionColor(result.collection),
          child: Text(
            result.collection.substring(0, 1).toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          result.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.nameArabic.isNotEmpty)
              Text(
                result.nameArabic,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _getCollectionColor(result.collection).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                result.collection,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _getCollectionColor(result.collection),
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _onResultTap(result),
      ),
    );
  }

  Color _getCollectionColor(String collection) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
    ];

    return colors[collection.hashCode % colors.length];
  }

  void _onResultTap(SearchResultEntity result) {
    // Handle result tap - navigate to detail page
    // You can customize this based on your app's navigation
    print('Tapped on: ${result.name} from ${result.collection}');

    // Example navigation:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailPage(
    //       id: result.id,
    //       collection: result.collection,
    //     ),
    //   ),
    // );
  }
}
