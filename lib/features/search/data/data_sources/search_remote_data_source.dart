import 'dart:developer';

import 'package:your_tour_guide/core/errors/exceptions.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/core/utils/backend_endpoints.dart';
import '../models/search_result_model.dart';
import '../../domain/entities/search_params_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchResultModel>> searchAcrossCollections(
      SearchParamsEntity params);

  Future<List<String>> getSearchSuggestions(String query, {int limit = 10});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final DatabaseServices databaseServices;

  SearchRemoteDataSourceImpl({required this.databaseServices});

  //Search In Collection with specific field
  Future<List<SearchResultModel>> _searchByField({
    required String query,
    required String collection,
    required String field,
    required int limit,
  }) async {
    try {
      List<Map<String, dynamic>> searchList = await databaseServices.searchData(
          path: collection, searchField: field, query: query, limit: limit);
      List<SearchResultModel> searchResults = searchList
          .map((e) => SearchResultModel.fromJson(e, collection))
          .toList();
      log(searchResults.toString());
      return searchResults;
    } catch (e) {
      print('Error searching field $field in collection $collection: $e');
      return [];
    }
  }

  //-------------------------------------------------------------------
  //one collection search with name and nameArabic
  Future<List<SearchResultModel>> _searchInCollection({
    required String query,
    required String collection,
    int? limit,
  }) async {
    try {
      List<SearchResultModel> results = [];
      int fieldLimit = limit != null ? (limit / 2).ceil() : 10;

      // Search by name field
      final nameResults = await _searchByField(
        query: query,
        collection: collection,
        field: 'name',
        limit: fieldLimit,
      );
      results.addAll(nameResults);

      // Search by nameArabic field
      final nameArabicResults = await _searchByField(
        query: query,
        collection: collection,
        field: 'nameArabic',
        limit: fieldLimit,
      );
      results.addAll(nameArabicResults);

      return results;
    } catch (e) {
      print('Error searching in collection $collection: $e');
      return [];
    }
  }

  //-------------------------------------------------------------------
  //many collections search
  @override
  Future<List<SearchResultModel>> searchAcrossCollections(
      SearchParamsEntity params) async {
    try {
      // 1- Create List of collection
      List<String> collectionsToSearch =
          params.specificCollections ?? BackEndEndPoints.searchableCollections;
      // 2- create List of Search Future
      List<Future<List<SearchResultModel>>> searchFutures = [];

      // 3- add search result of each collection in search list
      for (String collection in collectionsToSearch) {
        searchFutures.add(_searchInCollection(
          query: params.query.trim(),
          collection: collection,
          limit: params.limit,
        ));
      }

      List<List<SearchResultModel>> results = await Future.wait(searchFutures);

      // Flatten results
      List<SearchResultModel> allResults = [];
      for (var result in results) {
        allResults.addAll(result);
      }

      // Remove duplicates
      allResults = _removeDuplicates(allResults);

      // Sort by relevance if requested
      if (params.sortByRelevance) {
        allResults = _sortByRelevance(allResults, params.query);
      }

      // Apply global limit if specified
      if (params.limit != null && allResults.length > params.limit!) {
        allResults = allResults.take(params.limit!).toList();
      }

      return allResults;
    } catch (e) {
      throw CustomExceptions(
          message: 'Failed to search across collections: $e');
    }
  }

  //-------------------------------------------------------------------
  @override
  Future<List<String>> getSearchSuggestions(String query,
      {int limit = 10}) async {
    try {
      SearchParamsEntity params = SearchParamsEntity(
        query: query,
        limit: limit * 2,
      );

      List<SearchResultModel> results = await searchAcrossCollections(params);

      Set<String> suggestions = {};

      for (var result in results) {
        if (result.name.toLowerCase().contains(query.toLowerCase())) {
          suggestions.add(result.name);
        }
        if (result.nameArabic.toLowerCase().contains(query.toLowerCase())) {
          suggestions.add(result.nameArabic);
        }
      }

      return suggestions.take(limit).toList();
    } catch (e) {
      throw CustomExceptions(message: 'Failed to get search suggestions: $e');
    }
  }
  //-------------------------------------------------------------------

  List<SearchResultModel> _removeDuplicates(List<SearchResultModel> results) {
    Map<String, SearchResultModel> uniqueResults = {};

    for (var result in results) {
      String key = '${result.collection}_${result.id}';
      if (!uniqueResults.containsKey(key)) {
        uniqueResults[key] = result;
      }
    }

    return uniqueResults.values.toList();
  }

  //-------------------------------------------------------------------
  List<SearchResultModel> _sortByRelevance(
      List<SearchResultModel> results, String query) {
    results.sort((a, b) {
      String aName = a.name.toLowerCase();
      String aNameArabic = a.nameArabic.toLowerCase();
      String bName = b.name.toLowerCase();
      String bNameArabic = b.nameArabic.toLowerCase();
      String lowerQuery = query.toLowerCase();

      // Exact matches first
      bool aExactMatch = aName == lowerQuery || aNameArabic == lowerQuery;
      bool bExactMatch = bName == lowerQuery || bNameArabic == lowerQuery;

      if (aExactMatch && !bExactMatch) return -1;
      if (!aExactMatch && bExactMatch) return 1;

      // Starts with matches second
      bool aStartsWith =
          aName.startsWith(lowerQuery) || aNameArabic.startsWith(lowerQuery);
      bool bStartsWith =
          bName.startsWith(lowerQuery) || bNameArabic.startsWith(lowerQuery);

      if (aStartsWith && !bStartsWith) return -1;
      if (!aStartsWith && bStartsWith) return 1;

      // Alphabetical order for the rest
      return aName.compareTo(bName);
    });

    return results;
  }

  //-------------------------------------------------------------------
}
