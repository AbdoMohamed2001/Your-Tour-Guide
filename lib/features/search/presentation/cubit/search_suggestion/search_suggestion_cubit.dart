import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/get_search_suggestion_usecase.dart';

part 'search_suggestion_state.dart';

class SearchSuggestionCubit extends Cubit<SearchSuggestionState> {
  final GetSearchSuggestionsUseCase getSearchSuggestionsUseCase;
  SearchSuggestionCubit(this.getSearchSuggestionsUseCase)
      : super(SearchSuggestionsInitial());
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
      (failure) => emit(SearchSuggestionsError(failure.message)),
      (suggestions) => emit(SearchSuggestionsSuccess(suggestions)),
    );
  }
}
