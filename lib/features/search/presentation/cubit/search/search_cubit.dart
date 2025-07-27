import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/search_params_entity.dart';
import '../../../domain/entities/search_result_entity.dart';
import '../../../domain/use_cases/get_entity_from_search_usecase.dart';
import '../../../domain/use_cases/get_search_suggestion_usecase.dart';
import '../../../domain/use_cases/search_collections_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchAcrossCollectionsUseCase searchAcrossCollectionsUseCase;
  final GetSearchSuggestionsUseCase getSearchSuggestionsUseCase;
  final GetEntityFromSearchUseCase getEntityFromSearch;

  SearchCubit(this.searchAcrossCollectionsUseCase,
      this.getSearchSuggestionsUseCase, this.getEntityFromSearch)
      : super(SearchInitial());

  Future<void> fetchEntity(SearchResultEntity search) async {
    emit(SearchGetEntityLoading());
    final result = await getEntityFromSearch(search);
    result.fold(
      (fail) {
        emit(SearchGetEntityError(fail.message));
      },
      (entity) {
        emit(SearchGetEntitySuccess(entity, search.collection));
      },
    );
  }

//------------------------------------------------------------------
  List<SearchResultEntity> searchResults = [];
  String searchQuery = '';
  Future<void> search(
    SearchParamsEntity searchParamsEntity,
  ) async {
    if (searchParamsEntity.query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());

    final result = await searchAcrossCollectionsUseCase(searchParamsEntity);

    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (results) {
        if (results.isEmpty) {
          emit(SearchEmpty(searchParamsEntity.query));
        } else {
          searchResults = results;
          searchQuery = searchParamsEntity.query;
          emit(
              SearchSuccess(results: results, query: searchParamsEntity.query));
        }
      },
    );
  }
}
