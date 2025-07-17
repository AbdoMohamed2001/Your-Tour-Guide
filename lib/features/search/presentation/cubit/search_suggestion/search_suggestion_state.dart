part of 'search_suggestion_cubit.dart';

@immutable
sealed class SearchSuggestionState extends Equatable {
  const SearchSuggestionState();
  @override
  List<Object> get props => [];
}

class SearchSuggestionsInitial extends SearchSuggestionState {}

class SearchSuggestionsLoading extends SearchSuggestionState {}

class SearchSuggestionsSuccess extends SearchSuggestionState {
  final List<String> suggestions;

  const SearchSuggestionsSuccess(this.suggestions);

  @override
  List<Object> get props => [suggestions];
}

class SearchSuggestionsError extends SearchSuggestionState {
  final String message;

  const SearchSuggestionsError(this.message);

  @override
  List<Object> get props => [message];
}
