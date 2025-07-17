import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/search_params_entity.dart';
import '../../../domain/entities/search_result_entity.dart';
import '../../../domain/use_cases/get_search_suggestion_usecase.dart';
import '../../../domain/use_cases/search_collections_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchAcrossCollectionsUseCase searchAcrossCollectionsUseCase;
  final GetSearchSuggestionsUseCase getSearchSuggestionsUseCase;
  SearchCubit(
      this.searchAcrossCollectionsUseCase, this.getSearchSuggestionsUseCase)
      : super(SearchInitial());

  Timer? _debounceTimer;
  String _currentQuery = '';
  void searchWithDebounce(
    String query, {
    List<String>? specificCollections,
    int? limit,
    bool sortByRelevance = true,
    Duration debounceTime = const Duration(milliseconds: 500),
  }) {
    _currentQuery = query;
    _debounceTimer?.cancel();

    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    _debounceTimer = Timer(debounceTime, () {
      if (_currentQuery == query) {
        search(
          query,
          specificCollections: specificCollections,
          limit: limit,
          sortByRelevance: sortByRelevance,
        );
      }
    });
  }

  Future<void> search(
    String query, {
    List<String>? specificCollections,
    int? limit,
    bool sortByRelevance = true,
  }) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    final params = SearchParamsEntity(
      query: query.trim(),
      specificCollections: specificCollections,
      limit: limit,
      sortByRelevance: sortByRelevance,
    );

    final result = await searchAcrossCollectionsUseCase(params);

    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (results) {
        if (results.isEmpty) {
          emit(SearchEmpty(query));
        } else {
          emit(SearchSuccess(results: results, query: query));
        }
      },
    );
  }

  void clearSearch() {
    _debounceTimer?.cancel();
    _currentQuery = '';
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
