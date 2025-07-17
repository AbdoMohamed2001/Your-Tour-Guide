import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/get_search_suggestion_usecase.dart';

part 'search_suggestion_state.dart';

class SearchSuggestionCubit extends Cubit<SearchSuggestionState> {
  final GetSearchSuggestionsUseCase getSearchSuggestionsUseCase;
  SearchSuggestionCubit(this.getSearchSuggestionsUseCase)
      : super(SearchSuggestionsInitial());

  Timer? _debounceTimer;
  String _currentQuery = '';

  void getSuggestionsWithDebounce(
    String query, {
    int limit = 5,
    Duration debounceTime = const Duration(milliseconds: 300),
  }) {
    _currentQuery = query;
    _debounceTimer?.cancel();

    if (query.trim().isEmpty) {
      emit(SearchSuggestionsInitial());
      return;
    }
    _debounceTimer = Timer(debounceTime, () {
      if (_currentQuery == query) {
        getSuggestions(query, limit: limit);
      }
    });
  }

  Future<void> getSuggestions(String query, {int limit = 5}) async {
    if (query.trim().isEmpty) {
      emit(SearchSuggestionsInitial());
      return;
    }

    emit(SearchSuggestionsLoading());

    final params = GetSearchSuggestionsParams(
      query: query.trim(),
      limit: limit,
    );

    final result = await getSearchSuggestionsUseCase(params);

    result.fold(
      (failure) => emit(SearchSuggestionsError(_mapFailureToMessage(failure))),
      (suggestions) => emit(SearchSuggestionsSuccess(suggestions)),
    );
  }

  void clearSuggestions() {
    _debounceTimer?.cancel();
    _currentQuery = '';
    emit(SearchSuggestionsInitial());
  }

  String _mapFailureToMessage(failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;

      default:
        return 'Unexpected error occurred';
    }
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
