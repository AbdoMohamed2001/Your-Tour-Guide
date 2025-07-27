part of 'search_cubit.dart';

@immutable
sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SearchResultEntity> results;
  final String query;

  const SearchSuccess({
    required this.results,
    required this.query,
  });

  @override
  List<Object> get props => [results, query];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchEmpty extends SearchState {
  final String query;

  const SearchEmpty(this.query);

  @override
  List<Object> get props => [query];
}

//-------------------------------------------------------------------
class SearchGetEntityLoading extends SearchState {}

class SearchGetEntitySuccess extends SearchState {
  final dynamic entity;
  final String collectionName;
  const SearchGetEntitySuccess(this.entity, this.collectionName);

  @override
  List<Object> get props => [entity];
}

class SearchGetEntityError extends SearchState {
  final String message;

  const SearchGetEntityError(this.message);

  @override
  List<Object> get props => [message];
}
